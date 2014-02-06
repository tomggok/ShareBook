//
//  NSObject+DragonRequestResponder.h
//  DragonFramework
//
//  Created by NewM on 13-4-1.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dragon_Request.h"
#import "Dragon_RequestQueue.h"

@interface NSObject (DragonRequestResponder)


@property (nonatomic, readonly) DragonRequestBlockS  HTTP_GET;
@property (nonatomic, readonly) DragonRequestBlockS  HTTP_GET_DOWN;
@property (nonatomic, readonly) DragonRequestBlockS  HTTP_POST;

//请求网络方式
- (DragonRequest *)GET:(NSString *)url;//异步请求
- (DragonRequest *)GET_SYNC:(NSString *)url;//同步
- (DragonRequest *)GETDOWN:(NSString *)url;//
- (DragonRequest *)POST:(NSString *)url;//
- (DragonRequest *)HTTP_GET:(NSString *)url;//
- (DragonRequest *)HTTP_GET_DOWN:(NSString *)url;//
- (DragonRequest *)HTTP_POST:(NSString *)url;//

- (BOOL)isRequestResponder;//判断是否请求的响应者
- (BOOL)isRequestingURL;//判断是否在请求
- (BOOL)isRequestingURL:(NSString *)url;//判断当前url是否在请求网络
- (NSArray *)requests;//获得请求网络的全部链接请求对象
- (NSArray *)requests:(NSString *)url;//获得当前url的请求对象
- (void)cancelRequests;//取消当前全部请求
- (void)cancelAllRequest;//取消这个应用的网络请求
- (void)cancelRequestWithUrl:(NSString *)url;//取消这个url全部的请求
- (void)cancelRequest:(DragonRequest *)request;//取消单个请求
- (NSString *)downFileName:(NSString *)url;//下载文件的名字
- (NSString *)downPathFileNameWithUrl:(NSString *)url;//下载文件的路径和名字

- (void)handleRequest:(DragonRequest *)request;

- (void)handleRequest:(DragonRequest *)request receiveObj:(id)receiveObj;

- (void)downloadProgress:(CGFloat)newProgress request:(DragonRequest *)request;



@end
