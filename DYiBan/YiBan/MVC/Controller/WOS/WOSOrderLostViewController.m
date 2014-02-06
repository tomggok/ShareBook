//
//  WOSOrderLostViewController.m
//  DYiBan
//
//  Created by tom zeng on 13-12-24.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "WOSOrderLostViewController.h"
#import "Cell2.h"
#import "WOSGoodFoodListCell.h"
#import "WOSOrderListCell.h"
#import "WOSOrderDetailViewController.h"


@interface WOSOrderLostViewController (){

    DYBUITableView *tbDataBank1;

}

@end

@implementation WOSOrderLostViewController

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
        
        [self.headview setTitle:@"我的订单"];
        
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        
        [self.view setBackgroundColor:ColorBG];
       [self setButtonImage:self.leftButton setImage:@"back"];
        
        
        
    }
    
    else if ([signal is:[DragonViewController CREATE_VIEWS]]) {
        
        for (int i = 0; i< 3; i ++) {
            
            UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0.0f + i*320/3 + i*1, 44.0f, 320/3, 30)];
            [btn1 setTitle:@"处理中" forState:UIControlStateNormal];
            [btn1 setTitleColor:ColorGryWhite forState:UIControlStateNormal];
            switch (i) {
                case 0:
                    [btn1 setTitle:@"处理中" forState:UIControlStateNormal];
                    [btn1 setTitleColor:ColorTextYellow forState:UIControlStateNormal];
                    break;
                case 1:
                    [btn1 setTitle:@"配送中" forState:UIControlStateNormal];
                    break;
                case 2:
                    [btn1 setFrame:CGRectMake(0.0f + i*320/3 + i *0.5 , 44.0f, 320/3, 30)];
                    [btn1 setTitle:@"已送到" forState:UIControlStateNormal];
                    break;
                    
                default:
                    break;
            }
            [btn1 setBackgroundColor:[UIColor blackColor]];
            [btn1 addTarget:self action:@selector(doSelect:) forControlEvents:UIControlEventTouchUpInside];
            [btn1 setTag:10 + i];
            [self.view addSubview:btn1];
            RELEASE(btn1);
        }
        
        
        [self.rightButton setHidden:YES];
        
        
        
        [self.view setBackgroundColor:[UIColor clearColor]];
        
        
             
        tbDataBank1 = [[DYBUITableView alloc]initWithFrame:CGRectMake(0.0f,  50 + 24, 320.0f, self.view.frame.size.height - 44) isNeedUpdate:YES];
        
        [tbDataBank1 setSeparatorColor:[UIColor clearColor]];
        [tbDataBank1 setTableViewType:DTableViewSlime];
        [tbDataBank1 setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:tbDataBank1];
        RELEASE(tbDataBank1);        

    }
    
    
    else if ([signal is:[DragonViewController DID_APPEAR]]) {

        DLogInfo(@"rrr");
        
    } else if ([signal is:[DragonViewController DID_DISAPPEAR]]){
        
        
    }
    
}

-(void)doSelect:(id)sender{

    UIButton *btn = (UIButton *)sender;
    for (int i = 10; i < 13; i++) {
        
        
        UIButton *btn1 = (UIButton *)[self.view viewWithTag:i];
        if (i == btn.tag) {
            
            [btn1 setTitleColor:ColorTextYellow forState:UIControlStateNormal];
        }else{
            
            [btn1 setTitleColor:ColorGryWhite forState:UIControlStateNormal];
        }
    }
}

-(void)backMan{
    
    
    
//    WOSLogInViewController *login = [[WOSLogInViewController alloc]init];
//    [self.drNavigationController pushViewController:login animated:YES];
//    RELEASE(login);
    
    
    
}


- (void)handleViewSignal_DragonUITableView:(DragonViewSignal *)signal{
    
    if ([signal is:[DragonUITableView TABLENUMROWINSEC]])//numberOfRowsInSection
        
    {
        
        NSNumber *s = [NSNumber numberWithInteger:4];
        
        [signal setReturnValue:s];

    }else if ([signal is:[DragonUITableView TABLENUMOFSEC]])//numberOfSectionsInTableView
        
    {
        
        NSNumber *s = [NSNumber numberWithInteger:1];
        
        [signal setReturnValue:s];

    }
    
    else if ([signal is:[DragonUITableView TABLEHEIGHTFORROW]])//heightForRowAtIndexPath
        
    {
        
        [signal setReturnValue:[NSNumber numberWithInteger:80]];
        
    }
    
    else if ([signal is:[DragonUITableView TABLETITLEFORHEADERINSECTION]])//titleForHeaderInSection
        
    {
        [signal setReturnValue:nil];
    }
    
    else if ([signal is:[DragonUITableView TABLEVIEWFORHEADERINSECTION]])//viewForHeaderInSection
        
    {
        
        [signal setReturnValue:nil];

    }
    
    else if ([signal is:[DragonUITableView TABLETHEIGHTFORHEADERINSECTION]])//heightForHeaderInSection
        
    {
        
        [signal setReturnValue:[NSNumber numberWithFloat:0.0]];
        
    }
    
    else if ([signal is:[DragonUITableView TABLECELLFORROW]])//cell
        
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        //        UITableView *tableView = [dict objectForKey:@"tableView"];
        WOSOrderListCell *cell = [[WOSOrderListCell alloc]init];
        [cell setBackgroundColor:ColorBG];
      
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [signal setReturnValue:cell];
        
    }else if ([signal is:[DragonUITableView TABLEDIDSELECT]])//选中cell
        
    {
                
        NSDictionary *dict = (NSDictionary *)[signal object];
        
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
           
        WOSOrderDetailViewController *detail = [[WOSOrderDetailViewController alloc]init];
        [self.drNavigationController pushViewController:detail animated:YES];
        RELEASE(detail);
        
        
        
    }else if([signal is:[DragonUITableView TABLESCROLLVIEWDIDENDDRAGGING]])/*滚动停止*/{
        
        
        
        
        
    }else if([signal is:[DragonUITableView TABLESCROLLVIEWDIDSCROLL]])/*滚动*/{
        
        
        
    }else if ([signal is:[DragonUITableView TABLEVIEWUPDATA]]) //刷新
        
    {
        
        //        DragonUIUpdateView *uptableview = (DragonUIUpdateView *)[signal object];
        
        
        
        
        
    }else if([signal is:[DragonUITableView TAbLEVIEWLODATA]]) //加载更多
        
    {
        
        
        
        
        
    }else if ([signal is:[DragonUITableView TAbLEVIEWSCROLLUP]]){ //上滑动
        
        
        
        //        [tbDataBank StretchingUpOrDown:0];
        
        //        [DYBShareinstaceDelegate opeartionTabBarShow:YES];
        
        
        
    }else if ([signal is:[DragonUITableView TAbLEVIEWSCROLLDOWN]]){ //下滑动
        
        
        
        //        [tbDataBank StretchingUpOrDown:1];
        
        //        [DYBShareinstaceDelegate opeartionTabBarShow:NO];
        
    }
    
    
    
}



- (void)handleViewSignal_DYBBaseViewController:(DragonViewSignal *)signal

{
    
    if ([signal is:[DYBBaseViewController BACKBUTTON]])
        
    {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
    if ([signal is:[DYBBaseViewController NEXTSTEPBUTTON]])
        
    {
        
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    
    [super dealloc];
}
@end
