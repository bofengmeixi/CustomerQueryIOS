//
//  HttpRequest.m
//  CustomerQuery
//
//  Created by apple on 2018/12/13.
//  Copyright © 2018 诸葛云游. All rights reserved.
//

#import "HttpRequest.h"
//#import "AFNetworkActivityIndicatorManager.h"
#import <Foundation/Foundation.h>

@implementation HttpRequest

-(NSString *)httpGet:(NSString *)URLString
parameters:(id)parameters
{
    //NSURL *url = [NSURL URLWithString:@"http://54.222.236.168:8084/v1/name/ss"];
    URLString = [URLString stringByAppendingString:parameters];
    NSURL *url = [NSURL URLWithString:URLString];
    
    
    //第二步，通过URL创建网络请求
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    NSMutableURLRequest *mutableRequest = [request mutableCopy];    //拷贝request
    NSString *auth=[self encode:@"123456:123456"];
    auth=[@"Basic " stringByAppendingString:auth];
    //[mutableRequest addValue:@"Basic MTIzNDU2OjEyMzQ1Ng==" forHTTPHeaderField:@"Authorization"];
    [mutableRequest addValue:auth forHTTPHeaderField:@"Authorization"];
    request = [mutableRequest copy];

    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    
    NSString *str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    NSLog(@"返回数据：%@",str);
    return str;
    
    //
}


-(NSString *)login:(NSString *)usename
          withPassword:(id)password
{
    NSURL *url = [NSURL URLWithString:@"http://54.222.236.168:8084/AuthTest"];
    
    
    //第二步，通过URL创建网络请求
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    NSMutableURLRequest *mutableRequest = [request mutableCopy];    //拷贝request
    NSString *auth=[[usename stringByAppendingString:@":"]stringByAppendingString:password];
    auth=[self encode:auth];
    auth=[@"Basic " stringByAppendingString:auth];
    //[mutableRequest addValue:@"Basic MTIzNDU2OjEyMzQ1Ng==" forHTTPHeaderField:@"Authorization"];
    [mutableRequest addValue:auth forHTTPHeaderField:@"Authorization"];
    request = [mutableRequest copy];
    
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    
    NSString *str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    return str;
}

- (NSString *)encode:(NSString *)string
{
    //先将string转换成data
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    
    return baseString;
}


//static id _instance = nil;
//+ (instancetype)sharedInstance {
//    return [[self alloc] init];
//}
//
//+ (instancetype)allocWithZone:(struct _NSZone *)zone {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [super allocWithZone:zone];
//    });
//    return _instance;
//}
//
//- (instancetype)init {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [super init];
//        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//        [manager startMonitoring];
//        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//            switch (status) {
//                case AFNetworkReachabilityStatusUnknown:
//                {
//                    // 位置网络
//                    NSLog(@"位置网络");
//                }
//                    break;
//                case AFNetworkReachabilityStatusNotReachable:
//                {
//                    // 无法联网
//                    NSLog(@"无法联网");
//                }
//                    break;
//                case AFNetworkReachabilityStatusReachableViaWiFi:
//                {
//                    // 手机自带网络
//                    NSLog(@"当前使用的是2G/3G/4G网络");
//                }
//                    break;
//                case AFNetworkReachabilityStatusReachableViaWWAN:
//                {
//                    // WIFI
//                    NSLog(@"当前在WIFI网络下");
//                }
//            }
//        }];
//    });
//    return _instance;
//}
//
//#pragma mark -- GET请求 --
//- (void)getWithURLString:(NSString *)URLString
//              parameters:(id)parameters
//                 success:(void (^)(id))success
//                 failure:(void (^)(NSError *))failure {
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    /**
//     *  可以接受的类型
//     */
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    /**
//     *  请求队列的最大并发数
//     */
//    //    manager.operationQueue.maxConcurrentOperationCount = 5;
//    /**
//     *  请求超时的时间
//     */
//    manager.requestSerializer.timeoutInterval = 30;
//    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
//
//#pragma mark -- POST请求 --
//- (void)postWithURLString:(NSString *)URLString
//               parameters:(id)parameters
//                  success:(void (^)(id))success
//                  failure:(void (^)(NSError *))failure {
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
//
//#pragma mark -- POST/GET网络请求 --
//- (void)requestWithURLString:(NSString *)URLString
//                  parameters:(id)parameters
//                        type:(HttpRequestType)type
//                     success:(void (^)(id))success
//                     failure:(void (^)(NSError *))failure {
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    switch (type) {
//        case HttpRequestTypeGet:
//        {
//            [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                if (success) {
//                    success(responseObject);
//                }
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                if (failure) {
//                    failure(error);
//                }
//            }];
//        }
//            break;
//        case HttpRequestTypePost:
//        {
//            [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                if (success) {
//                    success(responseObject);
//                }
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                if (failure) {
//                    failure(error);
//                }
//            }];
//        }
//            break;
//    }
//}
//
//- (void)uploadWithURLString:(NSString *)URLString parameters:(id)parameters uploadParam:(NSArray<UploadParam *> *)uploadParams success:(void (^)())success failure:(void (^)(NSError *))failure {
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        for (UploadParam *uploadParam in uploadParams) {
//            [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.filename mimeType:uploadParam.mimeType];
//        }
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}
//
//#pragma mark - 下载数据
//- (void)downLoadWithURLString:(NSString *)URLString parameters:(id)parameters progerss:(void (^)())progress success:(void (^)())success failure:(void (^)(NSError *))failure {
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
//    NSURLSessionDownloadTask *downLoadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
//        if (progress) {
//            progress();
//        }
//    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
//        return targetPath;
//    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//    [downLoadTask resume];
//}

@end
