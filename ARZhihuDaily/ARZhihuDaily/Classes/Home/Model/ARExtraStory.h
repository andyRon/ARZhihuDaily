//
//  ARExtraStory.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARExtraStory : NSObject

/**长评论总数*/
@property (nonatomic, assign) long long_comments;
/**点赞总数*/
@property (nonatomic, assign) long popularity;
/**短评论总数*/
@property (nonatomic, assign) long short_comments;
/**评论总数*/
@property (nonatomic, assign) long comments;

@end
