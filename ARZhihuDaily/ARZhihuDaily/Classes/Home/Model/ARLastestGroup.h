//
//  ARLastestGroup.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARStory.h"

@interface ARLastestGroup : NSObject

@property (nonatomic, copy) NSString *header;

@property (nonatomic, strong) NSArray<ARStory *> *stories;

@end
