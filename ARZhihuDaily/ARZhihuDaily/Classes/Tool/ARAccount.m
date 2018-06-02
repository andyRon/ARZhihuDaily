//
//  ARAccount.m
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import "ARAccount.h"
#import "ARZhihuTool.h"
#import "NSString+MD5.h"

@interface ARAccount () {
    BOOL _isLogin;
    NSString *_name;
    NSString *_password;
    NSString *_avatar;
}

@end

static ARAccount *_account;

@implementation ARAccount

+ (instancetype)sharedAccount {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _account = [[self alloc] init];
        _account->_isLogin = [kUserDefaults boolForKey:@"isLogin"];
        _account->_name = [kUserDefaults stringForKey:@"name"];
        _account->_avatar = [kUserDefaults stringForKey:@"avatar"];
    });
    return _account;
}

+ (BOOL)loginWithName:(NSString *)name password:(NSString *)password {
    __block BOOL result = NO;
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [ARZhihuTool loginWithName:name password:password.md5sum success:^{
            _account->_isLogin = YES;
            [kUserDefaults setBool:YES forKey:@"isLogin"];
            [kUserDefaults setObject:name forKey:@"name"];
            _account->_avatar = @"http://pic1.zhimg.com/e70b91873695eb59e7d9a145f87a1688_m.jpg";
            [kUserDefaults setObject:_account->_avatar forKey:@"avatar"];
            _account->_name = name;
            [kNotificationCenter postNotificationName:NotiLogin object:nil];
            result = YES;
        } failure:nil];
    });
    return result;
}

- (void)logout {
    _isLogin = NO;
    [kNotificationCenter postNotificationName:NotiLogin object:nil];
    [kUserDefaults setBool:NO forKey:@"isLogin"];
    [kUserDefaults synchronize];
}

- (BOOL)isLogin {
    return _isLogin;
}

- (NSString *)avatar {
    return self.isLogin ? _avatar : @"http://i13.tietuku.com/e8a20966f7153539.png";
}

- (NSString *)name {
    return self.isLogin ? _name : @"请登录";
}

@end
