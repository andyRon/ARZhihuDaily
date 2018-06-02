//
//  ARCommentParam.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARCommentParam : NSObject

@property (nonatomic, assign) long long id;
/**长评论总数*/
@property (nonatomic, assign) long long_comments;

/**短评论总数*/
@property (nonatomic, assign) long short_comments;

+ (instancetype)commentWithId:(long long)storyid longComments:(long)longComment shortComment:(long)shortComment;

@end
