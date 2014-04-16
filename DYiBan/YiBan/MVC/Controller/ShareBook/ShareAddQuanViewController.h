//
//  ShareAddQuanViewController.h
//  ShareBook
//
//  Created by tom zeng on 14-2-24.
//  Copyright (c) 2014年 Tomgg. All rights reserved.
//

#import "DYBBaseViewController.h"
#import "DYBInputView.h"
#import "ShareBookMyQuanCenterViewController.h"


@interface ShareAddQuanViewController : DYBBaseViewController<CLLocationManagerDelegate,BMKSearchDelegate>
@property(nonatomic,assign)CLLocationCoordinate2D coordinate2D;
@property(nonatomic,retain)    DYBInputView  *_phoneInputName;
@property(nonatomic,retain)ShareBookMyQuanCenterViewController *vc;
//DEF_SIGNAL(SUCCUS);
AS_SIGNAL(SUCCUS)
@end
