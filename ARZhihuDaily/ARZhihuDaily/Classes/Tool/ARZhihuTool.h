//
//  ARZhihuTool.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "ARStory.h"
#import "ARTheme.h"
#import "AREditor.h"
#import "ARRecommender.h"

#import "ARHTTPTool.h"
#import "ARVersion.h"

#import "ARDetailStory.h"
#import "ARCacheTool.h"
#import "ARExtraStory.h"
#import "ARLastestParamResult.h"
#import "ARComment.h"
#import "ARAccount.h"
#import "ARRecommenderResult.h"
#import "ARThemeItem.h"

typedef void (^Completed)(id obj);
typedef void (^Success)(void);
typedef void (^Failure)(void);

@interface ARZhihuTool : NSObject

/**
 * 获取LaunchImage
 */
+ (void)getLaunchImageWithCompleted:(Completed)completed failure:(Failure)failure;

+ (void)queryAppWithVersion:(NSString *)version completed:(Completed)completed;

/**
 * 获取story详情
 */
+ (void)getDetailWithId:(long long)storyid completed:(Completed)completed;

/**
 *  获取故事额外信息，如评论数，赞数
 */
+ (void)getExtraWithId:(long long)storyid completed:(Completed)completed;

/**
 * 获取最新的storyList
 */
+ (void)getLastestStoryWithCompleted:(Completed)completed;

/**
 * 获取story的长评论
 */
+ (void)getLongCommentsWithId:(long long)storyid completed:(Completed)completed;

+ (void)getBeforeLongCommentsWithId:(long long)storyid commentid:(long)commentid completed:(Completed)completed;

/**
 *  获取story的短评论
 */
+ (void)getShortCommentsWithId:(long long)storyid completed:(Completed)completed;

+ (void)getBeforeShortCommentsWithId:(long long)storyid commentid:(long)commentid completed:(Completed)completed;

/**
 *  获取所有的 theme //主题列表相对稳定，所以可以缓存
 */
+ (void)getThemesWithCompleted:(Completed)completed;

// 收藏或者取消专栏
+ (void)collectedWithTheme:(ARTheme *)theme;
+ (void)cancelCollectedWithTheme:(ARTheme *)theme;

/**
 *  根据 NSDate类型时间获取当日之前的story
 */
+ (void)getBeforeStroyWithDate:(NSDate *)date completed:(Completed)completed;
/**
 *  根据 时间串(20151204)获取当日之前的story
 */
+ (void)getBeforeStroyWithDateString:(NSString *)dateString completed:(Completed)completed;

/**
 *  根据 主题 id 获取主题 最新列表
 */
+ (void)getThemeWithId:(int)themeId completed:(Completed)completed;

/**
 *  获取某个专栏story之前的story
 *
 */
+ (void)getBeforeThemeStoryWithId:(int)themeid storyId:(long long)storyId completed:(Completed)completed;
/**
 *  获取story的推荐者
 */
+ (void)getStoryRecommendersWithId:(long long)storyid completed:(Completed)completed;


// 获取当前用户的收藏的故事, 收藏/取消/查询收藏状态
+ (void)getColltedStoriesWithCompleted:(Completed)completed;
+ (void)collectedWithStroy:(ARStory *)story;
+ (void)cancelCollectedWithStroy:(ARStory *)story;
+ (BOOL)queryCollectedStatusWithStory:(ARStory *)story;


+ (NSString *)getEditorHomePageWithEditor:(AREditor *)editor;
+ (NSString *)getRecommenderHomePageWithRecommender:(ARRecommender *)recommender;

/**
 *  用户登录
 */
+ (void)loginWithName:(NSString *)name password:(NSString *)password success:(Success)success failure:(Failure)failure;
@end
