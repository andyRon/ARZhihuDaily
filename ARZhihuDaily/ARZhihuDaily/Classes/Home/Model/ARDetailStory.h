//
//  ARDetailStory.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARRecommender.h"

@interface ARDetailStory : NSObject

/** body */
@property (nonatomic, copy) NSString *body;

/** 图片来源 */
@property (nonatomic, copy) NSString *image_source;

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 图片*/
@property (nonatomic, copy) NSString *image;
/** 源url */
@property (nonatomic, copy) NSString *share_url;

/**推荐者*/
@property (nonatomic,strong) NSArray<ARRecommender *> *recommenders;

/**id  新闻的 id*/
@property (nonatomic, assign) long long id;

/**css  供手机端的 WebView(UIWebView) 使用*/
@property (nonatomic, strong) NSArray *css;

/**html  供手机端的 WebView(UIWebView) 使用*/
@property (nonatomic, copy) NSString *htmlStr;

@end
