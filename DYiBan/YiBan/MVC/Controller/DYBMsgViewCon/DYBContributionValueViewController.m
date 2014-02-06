//
//  DYBContributionValueViewController.m
//  DYiBan
//
//  Created by zhangchao on 13-9-11.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "DYBContributionValueViewController.h"
#import "UITableView+property.h"

@interface DYBContributionValueViewController ()
{
    DragonUITableView *_tbv;
}
@end

@implementation DYBContributionValueViewController

#pragma mark- ViewController信号
- (void)handleViewSignal_DragonViewController:(DragonViewSignal *)signal
{
    [super handleViewSignal:signal];
    
    if ([signal is:DragonViewController.CREATE_VIEWS]) {
        
        //        {//HTTP请求
        //            [self.view setUserInteractionEnabled:NO];
        //            DragonRequest *request = [DYBHttpMethod user_perguest:[_d_model objectForKey:@"userid"] isAlert:YES receive:self];
        //            [request setTag:1];
        //
        //            if (!request) {//无网路
        //                [_tbv.footerView changeState:VIEWTYPEFOOTER];
        //            }
        //        }
//        [self creatTbv];
        
    }else if ([signal is:DragonViewController.WILL_APPEAR]){
        [self.headview setTitle:@"近七天贡献值排名"];
        [self backImgType:0];
        
        
    }else if ([signal is:DragonViewController.DID_DISAPPEAR]){
        //        RELEASEVIEW(_tbv);//界面不显示时彻底释放TBV,已释放cell
        
    }else if ([signal is:[DragonViewController LAYOUT_VIEWS]])
    {
        
    }else if ([signal is:[DragonViewController FREE_DATAS]])//dealloc时回调,先释放数据
    {
        [_tbv releaseDataResource];
        
    }else if ([signal is:[DragonViewController DELETE_VIEWS]]){//dealloc时回调,再释放视图
        
        [_tbv release_muA_differHeightCellView];
        
        RELEASEVIEW(_tbv);//界面不显示时彻底释放TBV,已释放cell
        
    }
    
}


@end
