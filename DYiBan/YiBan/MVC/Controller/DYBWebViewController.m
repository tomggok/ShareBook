//
//  DYBWebViewController.m
//  DYiBan
//
//  Created by Hyde.Xu on 13-8-27.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "DYBWebViewController.h"

@interface DYBWebViewController ()

@end

@implementation DYBWebViewController


- (id)init:(NSString *)webURL{
    self = [super init];
    if (self) {
         _strURL = webURL;
    }
    return self;
}

#pragma mark- ViewController信号
- (void)handleViewSignal_DragonViewController:(DragonViewSignal *)signal
{
    if ([signal is:[DragonViewController WILL_APPEAR]])
    {
        [self.headview setTitle:@"网页"];
        [self backImgType:0];
        
    }else if ([signal is:[DragonViewController CREATE_VIEWS]]){
        DragonUIWebView *webView = [[DragonUIWebView alloc] initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height - self.headHeight)];
        
        if (![_strURL hasPrefix:@"http://"]) {
            _strURL = [NSString stringWithFormat:@"http://%@", _strURL];
        }
        
        [webView setUrl:_strURL];
        [self.view addSubview:webView];
        RELEASE(webView);
    }
}

- (void)handleViewSignal_DragonUIWebView:(DragonViewSignal *)signal{
     if ([signal is:[DragonUIWebView DIDLOADFINISH]]){
         DragonUIWebView *webView = (DragonUIWebView *)[signal source];
         [self.headview setTitle: [webView stringByEvaluatingJavaScriptFromString:@"document.title"]];
     }
}

@end
