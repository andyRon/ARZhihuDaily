//
//  ARLaunchController.m
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import "ARLaunchController.h"
#import "UIImageView+WebCache.h"
#import "ARZhihuTool.h"
#import "AppDelegate.h"
#import "MBProgressHUD+YS.h"
#import "ARNetworkTool.h"

#import "MJExtension.h"
#import "ARDetailStory.h"


#import "ARMainViewController.h"

@interface ARLaunchController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation ARLaunchController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url = [kUserDefaults stringForKey:@"launchScreen"];
    
    if (url) [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:url]];
    
    ARMainViewController *mainVC = [[ARMainViewController alloc] init];
    [mainVC view];
    
    [UIView animateWithDuration:1.89 animations:^{
        self.backgroundImageView.alpha = 0.0;
        self.backgroundImageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        
        [UIApplication sharedApplication].keyWindow.rootViewController = mainVC;
    }];
    
//    [ARDetailStory mj_setupObjectClassInArray:^NSDictionary *{
//        return @{@"recommenders":@"SYRecommender"};
//
//    }];
    
//    [ARZhihuTool getLaunchImageWithCompleted:^(id obj) {
//        [kUserDefaults setObject:obj forKey:@"launchScreen"];
//        [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:obj]];
//
//        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        delegate.mainController = mainVC;
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//            [UIView animateWithDuration:1.89 animations:^{
//                self.backgroundImageView.alpha = 0.0;
//                self.backgroundImageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
//            } completion:^(BOOL finished) {
//
//                [UIApplication sharedApplication].keyWindow.rootViewController = mainVC;
//            }];
//        });
//    } failure:^{
//        [MBProgressHUD showError:@"网络太差"];
//    }];
}



@end
