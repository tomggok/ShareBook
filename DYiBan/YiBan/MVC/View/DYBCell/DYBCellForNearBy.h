//
//  DYBCellForNearBy.h
//  DYiBan
//
//  Created by zhangchao on 13-8-13.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYBCellForNearBy : UITableViewCell
{
    DragonUIImageView *_imgV_showImg/*左边展示图*/;
    DragonUILabel *_lb_newContent,*_lb_nickName,*_lb_time,*_lb_distance;
}

-(void)setContent:(id)data indexPath:(NSIndexPath *)indexPath tbv:(UITableView *)tbv;

@end
