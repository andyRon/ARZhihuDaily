//
//  ARVersion.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARVersion : NSObject

@property (nonatomic, assign) int status;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *latest;

@end
