//
//  ARRecommenderItem.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARRecommender.h"

@interface ARRecommenderItem : NSObject

@property (nonatomic, assign) long index;
@property (nonatomic, strong) NSArray *recommenders;

@end
