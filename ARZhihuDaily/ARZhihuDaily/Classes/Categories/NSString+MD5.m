//
//  NSString+MD5.m
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

- (NSString *)md5sum {
    
    unsigned char digest[16], i;
    
    CC_MD5([self UTF8String], (CC_LONG)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i=0;i<16;i++) {
        [ms appendFormat: @"%x", (int)(digest[i])];
    }
    return [ms copy];
}

@end
