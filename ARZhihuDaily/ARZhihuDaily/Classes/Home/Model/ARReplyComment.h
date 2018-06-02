//
//  ARReplyComment.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARReplyComment : NSObject

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) int status;

@property (nonatomic, assign) long id;

@property (nonatomic, copy) NSString *author;

@end
