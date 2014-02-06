//
//  DYBCellForPersonalPhotoList.h
//  DYiBan
//
//  Created by Song on 13-9-12.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DYBCellForPersonalPhotoList : UITableViewCell
{
    DragonUILabel *_lb_newContent,*_lb_photolistnum;
    DragonUIImageView *_imgV_sepline/*分割线*/,*_imgV_star/**/;
    DragonUIImageView *_arrowImv;
}
@property(retain,nonatomic)DragonUIImageView *_imgV_star;
-(void)setContent:(id)data indexPath:(NSIndexPath *)indexPath tbv:(UITableView *)tbv;

@end
