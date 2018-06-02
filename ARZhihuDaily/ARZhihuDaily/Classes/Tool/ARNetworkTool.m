//
//  ARNetworkTool.m
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import "ARNetworkTool.h"
#import "Reachability.h"

@implementation ARNetworkTool

+ (ARNetworkType)getNetworkLinkType {
    
    Reachability *wifi = [Reachability reachabilityForLocalWiFi];
    // 2.检测手机是否能上网络(WIFI\3G\2.5G)
    Reachability *conn = [Reachability reachabilityForInternetConnection];
    
    if ([wifi currentReachabilityStatus] != NotReachable) { // 有wifi
        return ARNetworkTypeWiFi;
    } else if ([conn currentReachabilityStatus] != NotReachable) { // 没有使用wifi, 使用手机自带网络进行上网
        return ARNetworkType3G;
    }
    return ARNetworkTypeNone;
}

@end
