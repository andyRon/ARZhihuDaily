//
//  ARMainViewController.m
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import "ARMainViewController.h"

@interface ARMainViewController ()

@end

@implementation ARMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.maximumLeftDrawerWidth = 200;
    self.shouldStretchDrawer = NO;
    self.showsShadow = NO;
    
    [kNotificationCenter addObserver:self selector:@selector(openDrawer) name:OpenDrawer object:nil];
    [kNotificationCenter addObserver:self selector:@selector(closeDrawer) name:CloseDrawer object:nil];
    [kNotificationCenter addObserver:self selector:@selector(toggleDrawer) name:ToggleDrawer object:nil];
    
    
}



@end
