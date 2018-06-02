//
//  ARComment.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARReplyComment.h"

@interface ARComment : NSObject

@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, assign) long time;

@property (nonatomic, assign) long id;
@property (nonatomic, assign) long likes;

@property (nonatomic, strong) ARReplyComment *reply_to;


@property (nonatomic, assign) BOOL isLong;
@property (nonatomic, assign) BOOL isLike;

@property (nonatomic, assign) BOOL isOpen;

@end
