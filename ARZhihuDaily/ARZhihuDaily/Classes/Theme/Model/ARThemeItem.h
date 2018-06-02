//
//  ARThemeItem.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARStory.h"

@interface ARThemeItem : NSObject

@property (nonatomic, strong) NSMutableArray<ARStory *> *stories;


@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *background;

@property (nonatomic, assign) long color;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, strong) NSArray *editors;

@property (nonatomic, copy) NSString *image_source;

@end
