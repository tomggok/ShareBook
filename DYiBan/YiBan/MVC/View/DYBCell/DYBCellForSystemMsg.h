//
//  DYBCellForSystemMsg.h
//  DYiBan
//
//  Created by zhangchao on 13-8-9.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "reqlist.h"

@interface DYBCellForSystemMsg : UITableViewCell
{
    DragonUIImageView *_imgV_showImg/*左边展示图*/,*_imgV_newMsgNums/*新消息数量图*/;
    DragonUILabel *_lb_newContent,*_lb_nickName,*_lb_time;
    DragonUIButton *_bt_agree,*_bt_ignore;
    reqlist *model;
}

-(void)setContent:(id)data indexPath:(NSIndexPath *)indexPath tbv:(UITableView *)tbv;
@end
