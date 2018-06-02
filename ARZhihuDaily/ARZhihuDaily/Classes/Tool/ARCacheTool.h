//
//  ARCacheTool.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARBeforeStoryResult.h"
#import "ARDetailStory.h"
#import "ARStory.h"
#import "ARTheme.h"

@interface ARCacheTool : NSObject


+ (void)cancelCollectedWithUser:(NSString *)name story:(ARStory *)story;
+ (BOOL)queryCollectedStatusWithUser:(NSString *)name Story:(ARStory *)story;
+ (NSArray<ARStory *> *)queryCollectedStroyWithUser:(NSString *)name;

+ (void)cacheCollectionWithUser:(NSString *)name story:(ARStory *)story;



// 返回包含主题是否被收藏信息
+ (void)cacheThemeWithTheme:(ARTheme *)theme;
+ (NSArray *)queryThemeWithUser:(NSString *)user;


+ (void)cacheCollectionThemeWithUser:(NSString *)user theme:(ARTheme *)theme;
+ (void)cancelCollectedThemeWithUser:(NSString *)user theme:(ARTheme *)theme;



+ (ARBeforeStoryResult *)queryStoryListWithDateString:(NSString *)dateString;
+ (void)cacheStoryListWithObject:(ARBeforeStoryResult *)respObject;

+ (ARDetailStory *)queryStoryWithId:(long long)storyid;
+ (void)cacheStoryWithObject:(ARDetailStory *)story;


+ (void)cacheThemeStoryListWithId:(int)themeid respObject:(NSArray<ARStory *> *)respObject;
+ (NSArray<ARStory *> *)queryBeforeStoryListWithId:(int)themeid storyId:(long long)storyId;



+ (BOOL)loginWithName:(NSString *)name password:(NSString *)password;


+ (NSArray *)queryTables;

+ (NSUInteger)cachedSize;

+ (NSUInteger)imageSize;

+ (unsigned long long)dataSize;

+ (void)clearCache;


@end

