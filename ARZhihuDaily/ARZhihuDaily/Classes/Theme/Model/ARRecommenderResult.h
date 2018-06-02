//
//  ARRecommenderResult.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AREditor.h"
#import "ARRecommender.h"
#import "ARRecommenderItem.h"

@interface ARRecommenderResult : NSObject

@property (nonatomic, strong) NSArray *editors;

@property (nonatomic, strong) NSArray<ARRecommenderItem *> *items;

@end
