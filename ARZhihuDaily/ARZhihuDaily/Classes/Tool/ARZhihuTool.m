//
//  ARZhihuTool.m
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import "ARZhihuTool.h"
#import "ARHTTPTool.h"
#import "ARVersion.h"
#import "MJExtension.h"
#import "ARDetailStory.h"
#import "ARCacheTool.h"
#import "ARExtraStory.h"
#import "ARLastestParamResult.h"
#import "ARComment.h"
#import "ARAccount.h"
#import "ARRecommenderResult.h"
#import "ARThemeItem.h"

@implementation ARZhihuTool

+ (void)load {
    [ARDetailStory mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"recommenders":@"ARRecommender"};
    }];
    
    
    
    [ARLastestParamResult mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"top_stories":@"ARStory", @"stories":@"ARStory"};
    }];
    
    [ARBeforeStoryResult mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"stories":@"ARStory"};
    }];
    
    [ARThemeItem mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"stories": @"ARStory", @"editors":@"AREditor"};
    }];
    
    [ARThemeItem mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"desc":@"description"};
    }];
    
    [ARRecommenderResult mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"editors": @"AREditor", @"items":@"ARRecommenderItem"};
    }];
    [ARRecommenderItem mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"recommenders":@"ARRecommender"};
    }];
}

+ (void)getLaunchImageWithCompleted:(Completed)completed failure:(Failure)failure {
    NSString *launchImgUrl = @"http://news-at.zhihu.com/api/4/start-image/720*1184";
    
    [ARHTTPTool GETWithURL:launchImgUrl params:nil success:^(id responseObject) {
        NSString *urlStr = responseObject[@"img"];
        !completed ? : completed(urlStr);
    } failure:^(NSError *error) {
        !failure ? : failure();
    }];
}

+ (void)queryAppWithVersion:(NSString *)version completed:(Completed)completed {
    NSString *versionURL = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/version/ios/%@", version];
    
    [ARHTTPTool GETWithURL:versionURL params:nil success:^(id responseObject) {
        ARVersion *ver = [ARVersion mj_objectWithKeyValues:responseObject];
        !completed ? : completed(ver);
    } failure:nil];
}

+ (void)getDetailWithId:(long long)storyid completed:(Completed)completed {
    ARDetailStory *story = [ARCacheTool queryStoryWithId:storyid];
    if (story) {
        !completed ? : completed(story);
        return;
    }
    
    NSString *url = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/news/%lld", storyid];
    
    [ARHTTPTool GETWithURL:url params:nil success:^(id responseObject) {
        ARDetailStory *ds = [ARDetailStory mj_objectWithKeyValues:responseObject];
        
        ds.htmlStr = [NSString stringWithFormat:@"<html><head><link rel=\"stylesheet\" href=%@></head><body>%@</body></html>", ds.css[0], ds.body];
        
        !completed ? : completed(ds);
        
        [ARCacheTool cacheStoryWithObject:ds];
        
    } failure:nil];
}

+ (void)getExtraWithId:(long long)storyid completed:(Completed)completed {
    NSString *url = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/story-extra/%lld", storyid];
    
    [ARHTTPTool GETWithURL:url params:nil success:^(id responseObject) {
        ARExtraStory *es = [ARExtraStory mj_objectWithKeyValues:responseObject];
        !completed ? : completed(es);
    } failure:nil];
}

+ (void)getLastestStoryWithCompleted:(Completed)completed {
    NSString *url = @"http://news-at.zhihu.com/api/4/news/latest";
    
    [ARHTTPTool GETWithURL:url params:nil success:^(id responseObject) {
        ARLastestParamResult *r = [ARLastestParamResult mj_objectWithKeyValues:responseObject];
        !completed ? : completed(r);
    } failure:nil];
}

+ (void)getLongCommentsWithId:(long long)storyid completed:(Completed)completed {
    NSString *longCommentUrl = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/story/%lld/long-comments", storyid];
    
    [ARHTTPTool GETWithURL:longCommentUrl params:nil success:^(id responseObject) {
        NSArray<ARComment *> *comment = [ARComment mj_objectArrayWithKeyValuesArray:responseObject[@"comments"]];
        !completed ? : completed(comment);
    } failure:nil];
    
    
}
+ (void)getBeforeLongCommentsWithId:(long long)storyid commentid:(long)commentid completed:(Completed)completed {
    NSString *longBeforeUrl = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/story/%lld/long-comments/before/%ld", storyid, commentid];
    [ARHTTPTool GETWithURL:longBeforeUrl params:nil success:^(id responseObject) {
        NSArray *comments = [ARComment mj_objectArrayWithKeyValuesArray:responseObject[@"comments"]];
        
        !completed ? completed : completed(comments);
        
    } failure:nil];
}

+ (void)getShortCommentsWithId:(long long)storyid completed:(Completed)completed {
    NSString *shortCommentUrl = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/story/%lld/short-comments", storyid];
    [ARHTTPTool GETWithURL:shortCommentUrl params:nil success:^(id responseObject) {
        NSArray *comment = [ARComment mj_objectArrayWithKeyValuesArray:responseObject[@"comments"]];
        
        !completed ? : completed(comment);
    } failure:nil];
}


+ (void)getBeforeShortCommentsWithId:(long long)storyid commentid:(long)commentid completed:(Completed)completed {
    NSString *longBeforeUrl = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/story/%lld/short-comments/before/%ld", storyid, commentid];
    [ARHTTPTool GETWithURL:longBeforeUrl params:nil success:^(id responseObject) {
        NSArray *comments = [ARComment mj_objectArrayWithKeyValuesArray:responseObject[@"comments"]];
        
        !completed ? completed : completed(comments);
        
    } failure:nil];
}


// 获取主题列表
+ (void)getThemesWithCompleted:(Completed)completed {
    
    
    NSArray *themeStatus = [ARCacheTool queryThemeWithUser:[ARAccount sharedAccount].name];
    if (themeStatus.count > 0) {
        !completed ? : completed(themeStatus); // 这里是带有收藏信息的,但未排序
        return;
    }
    
    NSString *themeUrl = @"http://news-at.zhihu.com/api/4/themes";
    [ARHTTPTool GETWithURL:themeUrl params:nil success:^(id responseObject) {
        NSArray<ARTheme *> *themeArray = [ARTheme mj_objectArrayWithKeyValuesArray:responseObject[@"others"]];
        
        !completed ? : completed(themeArray);
        for (ARTheme *obj in themeArray) {
            [ARCacheTool cacheThemeWithTheme:obj];
        }
        
    } failure:nil];
}


+ (void)getLaunchImageWithCompleted:(Completed)completed {
    NSString *launchImgUrl = @"http://news-at.zhihu.com/api/4/start-image/720*1184";
    
    [ARHTTPTool GETWithURL:launchImgUrl params:nil success:^(id responseObject) {
        NSString *urlStr = responseObject[@"img"];
        !completed ? : completed(urlStr);
    } failure:nil];
    
}

+ (void)getBeforeStroyWithDate:(NSDate *)date completed:(Completed)completed {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    [self getBeforeStroyWithDateString:dateString completed:completed];
}


+ (void)getBeforeStroyWithDateString:(NSString *)dateString completed:(Completed)completed {
    
    
    ARBeforeStoryResult *result = [ARCacheTool queryStoryListWithDateString:dateString];
    
    if (result) {
        !completed ? : completed(result);
        return;
    }
    
    NSString *beforeUrl = [NSString stringWithFormat:@"http://news.at.zhihu.com/api/4/news/before/%@", dateString];
    
    [ARHTTPTool GETWithURL:beforeUrl params:nil success:^(id responseObject) {
        ARBeforeStoryResult *result = [ARBeforeStoryResult mj_objectWithKeyValues:responseObject];
        !completed ? : completed(result);
        [ARCacheTool cacheStoryListWithObject:result];
    } failure:nil];
}


+ (void)getThemeWithId:(int)themeId completed:(Completed)completed {
    
    NSString *themeUrl = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/theme/%d", themeId];
    [ARHTTPTool GETWithURL:themeUrl params:nil success:^(id responseObject) {
        ARThemeItem *item = [ARThemeItem mj_objectWithKeyValues:responseObject];
        !completed ? : completed(item);
    } failure:nil];
}


+ (void)getBeforeThemeStoryWithId:(int)themeid storyId:(long long)storyId completed:(Completed)completed {
    
    NSArray *objArray = [ARCacheTool queryBeforeStoryListWithId:themeid storyId:storyId];
    
    if (objArray.count > 0) {
        !completed ? :completed(objArray);
        return;
    }
    
    NSString *beforeUrl = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/theme/%d/before/%lld", themeid, storyId];
    
    [ARHTTPTool GETWithURL:beforeUrl params:nil success:^(id responseObject) {
        NSArray<ARStory *> *storyArray = [ARStory mj_objectArrayWithKeyValuesArray:responseObject[@"stories"]];
        
        !completed ? :completed(storyArray);
        
        [ARCacheTool cacheThemeStoryListWithId:themeid respObject:storyArray];
        
    } failure:nil];
}


+ (void)getStoryRecommendersWithId:(long long)storyid completed:(Completed)completed {
    NSString *url = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/story/%lld/recommenders", storyid];
    [ARHTTPTool GETWithURL:url params:nil success:^(id responseObject) {
        ARRecommenderResult *result = [ARRecommenderResult mj_objectWithKeyValues:responseObject];
        !completed ? : completed(result);
    } failure:nil];
}


// 获取当前用户的收藏
+ (void)getColltedStoriesWithCompleted:(Completed)completed {
    // 这里应该从网络中获取，但是当前仅仅是本地收藏
    NSArray *collted =  [ARCacheTool queryCollectedStroyWithUser:[ARAccount sharedAccount].name];
    !completed ? : completed(collted);
}

+ (BOOL)queryCollectedStatusWithStory:(ARStory *)story {
    return [ARCacheTool queryCollectedStatusWithUser:[ARAccount sharedAccount].name Story:story];
}


+ (void)collectedWithStroy:(ARStory *)story {
    [ARCacheTool cacheCollectionWithUser:[ARAccount sharedAccount].name story:story];
}

+ (void)cancelCollectedWithStroy:(ARStory *)story {
    [ARCacheTool cancelCollectedWithUser:[ARAccount sharedAccount].name story:story];
}

// 获取当前用户收藏的主题

// 收藏或者取消
+ (void)collectedWithTheme:(ARTheme *)theme {
    [ARCacheTool cacheCollectionThemeWithUser:[ARAccount sharedAccount].name theme:theme];
}
+ (void)cancelCollectedWithTheme:(ARTheme *)theme {
    [ARCacheTool cancelCollectedThemeWithUser:[ARAccount sharedAccount].name theme:theme];
}

+ (NSString *)getEditorHomePageWithEditor:(AREditor *)editor {
    return  [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/editor/%d/profile-page/ios", editor.id];
}

+ (NSString *)getRecommenderHomePageWithRecommender:(ARRecommender *)recommender {
    return [@"http://www.zhihu.com/people/" stringByAppendingString:recommender.zhihu_url_token];
}

+ (void)loginWithName:(NSString *)name password:(NSString *)password success:(Success)success failure:(Failure)failure {
    // 这里应该
    BOOL result = [ARCacheTool loginWithName:name password:password];
    result ? (!success? :success()) : (!failure? :failure());
}


@end

