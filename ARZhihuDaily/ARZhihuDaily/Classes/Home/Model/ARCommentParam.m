//
//  ARCommentParam.m
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import "ARCommentParam.h"

@implementation ARCommentParam

+ (instancetype)commentWithId:(long long)storyid longComments:(long)longComment shortComment:(long)shortComment {
    ARCommentParam *param = [[self alloc] init];
    param.id = storyid;
    param.long_comments = longComment;
    param.short_comments = shortComment;
    return param;
}

@end
