//
//  ShareBookApplyViewController.h
//  ShareBook
//
//  Created by tom zeng on 14-2-19.
//  Copyright (c) 2014年 Tomgg. All rights reserved.
//

#import "DYBBaseViewController.h"

//<<<<<<< HEAD
//@interface ShareBookApplyViewController : DYBBaseViewController
//@property(nonatomic,retain)NSDictionary *dictInfo;
//=======
@interface ShareBookApplyViewController : DYBBaseViewController<UITextFieldDelegate>
@property (nonatomic,retain)NSDictionary *dictInfo;
@property (nonatomic,retain)NSString *mi;
//>>>>>>> FETCH_HEAD
@end
