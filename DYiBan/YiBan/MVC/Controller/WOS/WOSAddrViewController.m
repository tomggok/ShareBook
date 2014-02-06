//
//  WOSAddrViewController.m
//  DYiBan
//
//  Created by tom zeng on 13-11-28.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "WOSAddrViewController.h"

@interface WOSAddrViewController ()

@end

@implementation WOSAddrViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)handleViewSignal_DragonViewController:(DragonViewSignal *)signal{
    
    DLogInfo(@"name -- %@",signal.name);
    
    if ([signal is:[DragonViewController LAYOUT_VIEWS]])
    {
        //        [self.rightButton setHidden:YES];
        [self.headview setTitle:@"地址簿"];
        
        //         [self setButtonImage:self.rightButton setImage:@"btn_more_def"];
        
        
    }
    else if ([signal is:[DragonViewController CREATE_VIEWS]]) {
        
        [self.rightButton setHidden:YES];
        
        [self.view setBackgroundColor:[UIColor clearColor]];
        
//        arrayTitle = [[NSArray alloc]initWithObjects:@"全部订单",@"地址簿",@"收藏夹",@"电子优惠券",@"找回密码", nil];
//        
//        
//        tbDataBank1 = [[DYBUITableView alloc]initWithFrame:CGRectMake(0.0f, SEARCHBAT_HIGH + 44, 320.0f, self.view.frame.size.height - SEARCHBAT_HIGH - 44 - 20 - 70 ) isNeedUpdate:YES];
//        
//        [tbDataBank1 setTableViewType:DTableViewSlime];
//        [self.view addSubview:tbDataBank1];
//        //        [tbDataBank setSeparatorColor:[UIColor clearColor]];
//        RELEASE(tbDataBank1);
        
        
    }
    
    
    else if ([signal is:[DragonViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[DragonViewController DID_DISAPPEAR]]){
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
