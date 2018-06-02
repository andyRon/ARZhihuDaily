//
//  ARHTTPTool.h
//  ARZhihuDaily
//
//  Created by andyron<http://andyron.com> on 2018/6/2.
//  Copyright © 2018年 andyron. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用来封装文件数据的模型
 */
@interface ARDataObject : NSObject
/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;

@end

@interface ARHTTPTool : NSObject

/**
 *  提交一个不带数据的POST请求
 *
 *  @param url     地址
 *  @param params  参数
 */
+ (void)POSTWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


+ (void)POSTWithURL:(NSString *)url params:(NSDictionary *)params dataArray:(NSArray<ARDataObject *> *)dataArray success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)GETWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


@end
