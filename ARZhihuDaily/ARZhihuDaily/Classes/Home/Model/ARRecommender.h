//
//  ARRecommender.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARRecommender : NSObject

@property (nonatomic, copy) NSString *bio;

@property (nonatomic, copy) NSString *zhihu_url_token;

@property (nonatomic, assign) long id;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *name;

@end
