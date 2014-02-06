//
//  DYBShareInNotesViewController.h
//  DYiBan
//
//  Created by zhangchao on 13-10-28.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "DYBBaseViewController.h"
#import "DYBMenuView.h"
#import "DYBVariableTbvView.h"
//共享页
@interface DYBShareInNotesViewController : DYBBaseViewController
{
    DragonUISearchBar *_search;
    DYBMenuView *_tbv_dropDown;//下拉列表
    DragonUIButton *_bt_DropDown/*下拉按钮*/;
    DYBVariableTbvView *_tbvView;//封装的公用tbv
    DragonUIButton *TraparentView;
    NSMutableArray *_muA_ShareMeData/*所有共享给我的笔记数据源*/,*_muA_MyShareData/*星标我共享的笔记数据源*/;
    
    int shareMePage;
    int mySharePage;
    DragonUIImageView *_imgV_noDataTip;//无数据提示
    DragonUILabel *_lb_noDataTip;//无数据提示
}
@end
