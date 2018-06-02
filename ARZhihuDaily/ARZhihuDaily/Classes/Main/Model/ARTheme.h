//
//  ARTheme.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARTheme : NSObject

@property (nonatomic, copy) NSString *thumbnail;

/**
 *  title
 */
@property (nonatomic, copy) NSString *name;

/**
 *
 */
@property (nonatomic, assign) int id;

/**
 *  是否被收藏
 */
@property (nonatomic, assign) BOOL isCollected;

@end
