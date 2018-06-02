//
//  ARStory.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARStory : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ga_prefix;
@property (nonatomic, strong) NSArray<NSString *> *images;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, assign) BOOL multipic;
@property (nonatomic, assign) int type;
@property (nonatomic, assign) long long id;

@end
