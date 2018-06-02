//
//  ARAccount.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARAccount : NSObject

@property (nonatomic, assign, readonly) BOOL isLogin;

@property (nonatomic, copy, readonly) NSString *name;

@property (nonatomic, copy, readonly) NSString *avatar;

+ (instancetype)sharedAccount;


// 必须等待登录过程成功，所以不需要回调block
+ (BOOL)loginWithName:(NSString *)name password:(NSString *)password;

- (void)logout;

@end
