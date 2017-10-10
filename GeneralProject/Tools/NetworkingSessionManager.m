//
//  NetworkingSessionManager.m
//  AFNetworking二次封装
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 Suomusic. All rights reserved.
//

#import "NetworkingSessionManager.h"
#import <objc/runtime.h>
#define requestTime                 10.f

static BOOL errorTip = NO;
@implementation NetworkingSessionManager

//@synthesize sessionManager;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sessionManager = [AFHTTPSessionManager manager];
        self.isErrorTip = YES;
    }
    return self;
}
- (instancetype) initWithErrorTip:(BOOL) tip
{
    self = [super init];
    if (self) {
        self.sessionManager = [AFHTTPSessionManager manager];
        self.isErrorTip = tip;
    }
    return self;
}

+ (instancetype) sharedManager
{
    static dispatch_once_t onceToken;
    static NetworkingSessionManager * sessionManager = nil;
    dispatch_once(&onceToken, ^{
        
        sessionManager = [[NetworkingSessionManager alloc] init];
        
        //添加网络状态改变监听
        AFNetworkReachabilityManager * reachabilityManager = [AFNetworkReachabilityManager sharedManager];
        [reachabilityManager startMonitoring];
        [reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            
            sessionManager.networkReachabilityStatus = status;
            
        }];
        
    });
    return sessionManager;
}


+ (void)POST:(NSString *)URLString
  parameters:(nullable NSMutableDictionary *)parameters
    progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
     success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
     failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    NSLog(@"parameters：%@",parameters);
    AFHTTPSessionManager* sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    sessionManager.requestSerializer.timeoutInterval = requestTime;  //设置请求超时时间
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
//    [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
//    [sessionManager.requestSerializer setValue:[parameters objectForKey:@"token"] forHTTPHeaderField:@"Authorization"];
    
  
    [sessionManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        NSLog(@"mag = %@",[responseObject objectForKey:@"msg"]);
        success(task,responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        failure(task,error);
        NSLog(@"error= %@",error);
        failure(task,error);
        long flag = error.code;
        //错误提示
        [NetworkingSessionManager errorTip:flag];
        
    }];
    
    
}



+ (void) GET:(NSString *)URLString
  parameters:(nullable id)parameters
    progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
     success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
     failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    
    //请求接口
    NSLog(@"parameters：%@",parameters);
    AFHTTPSessionManager * sessionManager = [AFHTTPSessionManager manager];
    sessionManager.responseSerializer = [[AFXMLParserResponseSerializer alloc] init];
//    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/javascript", @"text/xml", nil];
    sessionManager.requestSerializer.timeoutInterval = requestTime;  //设置请求超时时间
    
    [sessionManager GET:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {


        NSLog(@"%@",responseObject);

//        NSLog(@"msg = %@",[responseObject objectForKey:@"msg"]);
        
        success(task,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error= %@",error);
        if (failure != nil) {
            failure(task,error);
        }
//        long flag = error.code;
        //错误提示
//        [NetworkingSessionManager errorTip:flag];
    }];
    
    
}

+ (void)PUT:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    NSLog(@"parameters：%@",parameters);
    AFHTTPSessionManager* sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    sessionManager.requestSerializer.timeoutInterval = requestTime;  //设置请求超时时间
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    //    [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    //    [sessionManager.requestSerializer setValue:[parameters objectForKey:@"token"] forHTTPHeaderField:@"Authorization"];
    [sessionManager PUT:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"mag = %@",[responseObject objectForKey:@"msg"]);
        NSLog(@"%@",responseObject);
        success(task,responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(task,error);
        NSLog(@"error= %@",error);
        failure(task,error);
        long flag = error.code;
        //错误提示
        [NetworkingSessionManager errorTip:flag];
    }];

    
}

+ (void)DELETE:(NSString *)URLString
                      parameters:(id)parameters
                         success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                         failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    NSLog(@"parameters：%@",parameters);
    AFHTTPSessionManager* sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    sessionManager.requestSerializer.timeoutInterval = requestTime;  //设置请求超时时间
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    [sessionManager DELETE:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"mag = %@",[responseObject objectForKey:@"msg"]);
        NSLog(@"%@",responseObject);
        success(task,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(task,error);
        NSLog(@"error= %@",error);
        failure(task,error);
        long flag = error.code;
        //错误提示
        [NetworkingSessionManager errorTip:flag];
        
    }];
}
- (void) GET:(NSString *)URLString
  parameters:(nullable id)parameters
    progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
     success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
     failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    NSLog(@"parameters：%@",parameters);
    
    self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    self.sessionManager.requestSerializer.timeoutInterval = requestTime;  //设置请求超时时间
    [self.sessionManager GET:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        NSLog(@"mag = %@",[responseObject objectForKey:@"msg"]);
        success(task,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error= %@",error);
        failure(task,error);
        
        if (_isErrorTip) {
            long flag = error.code;
            
            //错误提示
            [NetworkingSessionManager errorTip:flag];
        }
        
    }];
    
    
}

- (void)POST:(NSString *)URLString
  parameters:(nullable id)parameters
    progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
     success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
     failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    NSLog(@"parameters：%@",parameters);
    
    self.sessionManager.requestSerializer.timeoutInterval = requestTime;  //设置请求超时时间
    self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [self.sessionManager POST:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"%@",responseObject);
        success(task,responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(task,error);
        
    }];
    
    
    
}
+ (void) errorTip:(long) flag
{
    switch (flag) {
        case -1009:
            [MBProgressHUD showError:@"亲，您的网络连接是不是关闭啦！"];
            break;
        case -1001:
            [MBProgressHUD showError:@"请求超时，请稍后重试"];
            break;
        case -1004:
            [MBProgressHUD showError:@"不好意思，我们的服务器去度假啦！"];
            break;
        case -1011:
            [MBProgressHUD showError:@"请把token拼到url后面"];
            break;
        default:
            break;
    }

}





//+ (void)validateUrl:(nonnull NSString *)candidate callback:(void (^)(BOOL available, NSInteger code))block {
//    if (candidate.length <= 0) {
//        block(NO, 10001);
//        return;
//    }
//    NSURL *url = [NSURL URLWithString:candidate];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"HEAD"];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"error %@",error);
//        block()
//        if (!request && error) {
//            NSLog(@"不可用");
//        }else{
//            NSLog(@"可用%@",request);
//        }
//    }];
//    [task resume];
//}




@end
