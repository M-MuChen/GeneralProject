//
//  NetworkingSessionManager.h
//  AFNetworking二次封装
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 Suomusic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPSessionManager.h>





@interface NetworkingSessionManager : NSObject



NS_ASSUME_NONNULL_BEGIN
@property (nonatomic, strong) AFHTTPSessionManager * sessionManager;
@property (nonatomic, assign) BOOL isErrorTip;



/*  网络状态
 AFNetworkReachabilityStatusUnknown          = -1,
 AFNetworkReachabilityStatusNotReachable     = 0,
 AFNetworkReachabilityStatusReachableViaWWAN = 1,
 AFNetworkReachabilityStatusReachableViaWiFi = 2,
 */
@property (nonatomic,assign) NSInteger networkReachabilityStatus;


//用来初始化一个对象，tip = NO 没有错误提示  tip = YES  有错误提示
- (instancetype) initWithErrorTip:(BOOL) tip;

//单例设计模式
+ (instancetype) sharedManager;


//Post请求
+ (void) POST:(nullable NSString *)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress * uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask * task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;
//Put请求
+ (void) PUT:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
//DELETE请求
+ (void)DELETE:(NSString *)URLString
    parameters:(id)parameters
       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

//Get请求
+ (void) GET:(nullable NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;


- (void) POST:(nullable NSString *)URLString
   parameters:(nullable id)parameters
     progress:(nullable void (^)(NSProgress * uploadProgress))uploadProgress
      success:(nullable void (^)(NSURLSessionDataTask * task, id _Nullable responseObject))success
      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;


- (void) GET:(nullable NSString *)URLString
  parameters:(nullable id)parameters
    progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
     success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
     failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;






//+ (void)validateUrl:(nonnull NSString *)candidate callback:(void (^)(BOOL available, NSInteger code))block;




NS_ASSUME_NONNULL_END
@end
