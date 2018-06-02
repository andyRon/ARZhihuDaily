//
//  ARNetworkTool.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, ARNetworkType) {
    ARNetworkTypeNone = 0,
    ARNetworkType2G = 1,
    ARNetworkType3G = 2,
    ARNetworkType4G = 3,
    ARNetworkType5G = 4, // /  5G目前为猜测结果
    ARNetworkTypeWiFi = 5,
};



@interface ARNetworkTool : NSObject

+ (ARNetworkType)getNetworkLinkType;

@end

