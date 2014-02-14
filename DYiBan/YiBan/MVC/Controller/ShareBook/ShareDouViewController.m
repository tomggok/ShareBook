//
//  ShareDouViewController.m
//  ShareBook
//
//  Created by tom zeng on 14-2-13.
//  Copyright (c) 2014年 Tomgg. All rights reserved.
//

#import "ShareDouViewController.h"
#import "ShareBookDouCell.h"

#import "ShareFriendListViewController.h"

@interface ShareDouViewController ()

@end

@implementation ShareDouViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)handleViewSignal_MagicViewController:(MagicViewSignal *)signal{
    
    DLogInfo(@"name -- %@",signal.name);
    
    if ([signal is:[MagicViewController LAYOUT_VIEWS]])
    {
        //        [self.rightButton setHidden:YES];
        [self.headview setTitle:@"乐享豆"];
        
        //        [self setButtonImage:self.leftButton setImage:@"back"];
        //        [self setButtonImage:self.rightButton setImage:@"home"];
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        [self.headview setBackgroundColor:[UIColor colorWithRed:97.0f/255 green:97.0f/255 blue:97.0f/255 alpha:1.0]];
//        [self.leftButton setHidden:YES];
        [self setButtonImage:self.leftButton setImage:@"icon_retreat"];
    }
    else if ([signal is:[MagicViewController CREATE_VIEWS]]) {
        
        [self.rightButton setHidden:YES];
        
        [self.view setBackgroundColor:[UIColor blackColor]];
        
        
        
        UIView *viewBG = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 44, 320.0f, self.view.frame.size.height - 44)];
        [viewBG setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:viewBG];
        RELEASE(viewBG);
        
        
        UILabel *labelDou = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, self.headHeight + 10, 100.0f, 20.0f)];
        [labelDou setText:@"我的享乐豆"];
        [labelDou sizeToFit];
        [self.view addSubview:labelDou];
        [labelDou release];
        
        
        UILabel *labelNum  = [[UILabel alloc]initWithFrame:CGRectMake(10.0f + CGRectGetMinX(labelDou.frame) + CGRectGetWidth(labelDou.frame), self.headHeight + 10 , 100.0f, 20.0f)];
        [labelNum setText:@"100"];
        [self.view addSubview:labelNum];
        [labelNum release];

        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, self.headHeight + 10 + 40, 100.0f, 20.0f)];
        [label1 setText:@"享乐豆充值可以在官网："];
        [label1 sizeToFit];
        [self.view addSubview:label1];
        [label1 release];
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake( CGRectGetMinX(label1.frame) + CGRectGetWidth(label1.frame), self.headHeight + 10 + 40, 100.0f, 20.0f)];
        [label2 setText:@"www.baidu.com"];
        [label2 sizeToFit];
        [self.view addSubview:label2];
        [label2 release];
        
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, self.headHeight + 10 + 40, 100.0f, 20.0f)];
//        [label3 setText:@"购买"];
        [label3 sizeToFit];
        [self.view addSubview:label3];
        [label3 release];
        
        UIImageView *imageViewIcon = [[UIImageView alloc]initWithFrame:CGRectMake(260.0, 10.0f, 50.0,50.0)];
        [imageViewIcon setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:imageViewIcon];
        [imageViewIcon release];
        
        UILabel *labelHistoryList = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, CGRectGetMinY(label2.frame) + CGRectGetHeight(label2.frame) + 20, 320.0f, 40.0f)];
        [labelHistoryList setText:@"乐豆交易记录"];
        [self.view addSubview:labelHistoryList];
        [labelHistoryList release];
        
        UIImage *image = [UIImage imageNamed:@"menu_inactive"];
        
        
        DYBUITableView * tbDataBank11 = [[DYBUITableView alloc]initWithFrame:CGRectMake(0,200 , 320.0f , self.view.frame.size.height -100 - 60 - 100  ) isNeedUpdate:YES];
        [tbDataBank11 setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:tbDataBank11];
        [tbDataBank11 setSeparatorColor:[UIColor colorWithRed:78.0f/255 green:78.0f/255 blue:78.0f/255 alpha:1.0f]];
        RELEASE(tbDataBank11);
        
        [self creatDownBar];
        
        
    }else if ([signal is:[MagicViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[MagicViewController DID_DISAPPEAR]]){
        
        
    }
}



#pragma mark- 只接受UITableView信号
static NSString *cellName = @"cellName";

- (void)handleViewSignal_MagicUITableView:(MagicViewSignal *)signal
{
    
    
    if ([signal is:[MagicUITableView TABLENUMROWINSEC]])/*numberOfRowsInSection*/{
        //        NSDictionary *dict = (NSDictionary *)[signal object];
        //        NSNumber *_section = [dict objectForKey:@"section"];
        NSNumber *s;
        
        //        if ([_section intValue] == 0) {
        s = [NSNumber numberWithInteger:10];
        //        }else{
        //            s = [NSNumber numberWithInteger:[_arrStatusData count]];
        //        }
        
        [signal setReturnValue:s];
        
    }else if([signal is:[MagicUITableView TABLENUMOFSEC]])/*numberOfSectionsInTableView*/{
        NSNumber *s = [NSNumber numberWithInteger:1];
        [signal setReturnValue:s];
        
    }else if([signal is:[MagicUITableView TABLEHEIGHTFORROW]])/*heightForRowAtIndexPath*/{
        
        NSNumber *s = [NSNumber numberWithInteger:50];
        [signal setReturnValue:s];
        
        
    }else if([signal is:[MagicUITableView TABLETITLEFORHEADERINSECTION]])/*titleForHeaderInSection*/{
        
    }else if([signal is:[MagicUITableView TABLEVIEWFORHEADERINSECTION]])/*viewForHeaderInSection*/{
        
    }else if([signal is:[MagicUITableView TABLETHEIGHTFORHEADERINSECTION]])/*heightForHeaderInSection*/{
        
    }else if([signal is:[MagicUITableView TABLECELLFORROW]])/*cell*/{
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
        ShareBookDouCell *cell = [[ShareBookDouCell alloc]init];
        
        //        NSDictionary *dictInfoFood = Nil;
        //        [cell creatCell:dictInfoFood];
        DLogInfo(@"%d", indexPath.section);
        
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [signal setReturnValue:cell];
        
    }else if([signal is:[MagicUITableView TABLEDIDSELECT]])/*选中cell*/{
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
        
        
        
    }else if([signal is:[MagicUITableView TABLESCROLLVIEWDIDSCROLL]])/*滚动*/{
        
    }else if ([signal is:[MagicUITableView TABLEVIEWUPDATA]]){
        
        
    }else if ([signal is:[MagicUITableView TAbLEVIEWLODATA]]){
    }else if ([signal is:[MagicUITableView TAbLEVIERETOUCH]]){
        
    }
    
    
    
}


-(void)creatDownBar{
    
    
    UIImage *image = [UIImage imageNamed:@"down_options_bg"];
    
    UIImageView *viewBar = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, self.view.frame.size.height -  image.size.height/2, 320.0f, image.size.height/2)];
    [viewBar setImage:[UIImage imageNamed:@"down_options_bg"]];
    [viewBar setBackgroundColor:[UIColor redColor]];
    [viewBar setUserInteractionEnabled:YES];
    [self.view addSubview:viewBar];
    RELEASE(viewBar);
    
    
    UIImage *btnImage = [UIImage imageNamed:@"bt02_click"];
    UIButton *btnYU = [[UIButton alloc]initWithFrame:CGRectMake(7.0f, (image.size.height/2 -btnImage.size.height/2)/2 , btnImage.size.width/2, btnImage.size.height/2)];
    [btnYU setTag:101];
    [btnYU setBackgroundColor:[UIColor clearColor]];
    [btnYU setImage:[UIImage imageNamed:@"bt02_click"] forState:UIControlStateHighlighted];
    [btnYU setImage:[UIImage imageNamed:@"bt02"] forState:UIControlStateNormal];
    [btnYU addTarget:self action:@selector(doBorrow:) forControlEvents:UIControlEventTouchUpInside];
    [self addlabel_title:@"向好友赠送享乐豆" frame:btnYU.frame view:btnYU textColor:[UIColor whiteColor]];
    [viewBar addSubview:btnYU];
    [btnYU release];
    
    //    [UIColor whiteColor];
    UIButton *btnBorrow = [[UIButton alloc]initWithFrame:CGRectMake(167, (image.size.height/2 -btnImage.size.height/2)/2 , btnImage.size.width/2, btnImage.size.height/2)];
    [btnBorrow setTag:102];
    [btnBorrow setImage:[UIImage imageNamed:@"bt01_click"] forState:UIControlStateHighlighted];
    [btnBorrow setImage:[UIImage imageNamed:@"bt01"] forState:UIControlStateNormal];
    [btnBorrow setBackgroundColor:[UIColor clearColor]];
    [self addlabel_title:@"享乐豆帮助" frame:btnBorrow.frame view:btnBorrow textColor:[UIColor blackColor]];
    [btnBorrow addTarget:self action:@selector(doBorrow:) forControlEvents:UIControlEventTouchUpInside];
    [viewBar addSubview:btnBorrow];
    [btnBorrow release];
}

-(void)addlabel_title:(NSString *)title frame:(CGRect)frame view:(UIView *)view textColor:(UIColor *)textColor{
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
    [label1 setText:title];
    [label1 setTag:100];
    [label1 setTextAlignment:NSTextAlignmentCenter];
    [view bringSubviewToFront:label1];
    [label1 setTextColor:textColor];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [view addSubview:label1];
    RELEASE(label1);
    
}



-(void)doBorrow:(id)sender{
    
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == 101) {
        
        ShareFriendListViewController *friend = [[ShareFriendListViewController alloc]init];
        [self.drNavigationController pushViewController:friend animated:YES];
        RELEASE(friend);
        
        
    }else{
        
        
        
        
        
    }
    
    
}




@end
