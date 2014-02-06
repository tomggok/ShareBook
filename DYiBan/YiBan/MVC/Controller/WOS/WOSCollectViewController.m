//
//  WOSCollectViewController.m
//  DYiBan
//
//  Created by tom zeng on 13-11-28.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "WOSCollectViewController.h"
#import "WOSGoodFoodListCell.h"
#import "WOShopDetailViewController.h"



@interface WOSCollectViewController ()

@end

@implementation WOSCollectViewController

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
        [self.headview setTitle:@"收藏夹"];
                [self setButtonImage:self.leftButton setImage:@"back"];
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        
        [self.view setBackgroundColor:ColorBG];
         [self setButtonImage:self.rightButton setImage:@"account"];
    }
    else if ([signal is:[DragonViewController CREATE_VIEWS]]) {
        
        
        DragonUITableView *tableView = [[DragonUITableView alloc]initWithFrame:CGRectMake(0.0f, 44 , 320,self.view.frame.size.height - 44)];
        [tableView setBackgroundColor:ColorBG];
        [tableView setSeparatorColor:[UIColor clearColor]];
        [self.view addSubview:tableView];
        RELEASE(tableView);        
    }
    
    
    else if ([signal is:[DragonViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[DragonViewController DID_DISAPPEAR]]){
        
        
    }
}


- (void)handleViewSignal_DragonUITableView:(DragonViewSignal *)signal{
    
    
    if ([signal is:[DragonUITableView TABLENUMROWINSEC]])//numberOfRowsInSection
    {
        NSNumber *s = [NSNumber numberWithInteger:5];
        [signal setReturnValue:s];
        
    }else if ([signal is:[DragonUITableView TABLENUMOFSEC]])//numberOfSectionsInTableView
    {
        NSNumber *s = [NSNumber numberWithInteger:1];
        [signal setReturnValue:s];
        
    }
    else if ([signal is:[DragonUITableView TABLEHEIGHTFORROW]])//heightForRowAtIndexPath
    {
        
        
        
        [signal setReturnValue:[NSNumber numberWithInteger:100]];
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
        
        WOSGoodFoodListCell *cell = [[WOSGoodFoodListCell alloc]initRow:indexPath.row];
        cell.row = indexPath.row;
        [cell setBackgroundColor:ColorBG];
    
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [signal setReturnValue:cell];
        
        
    }else if ([signal is:[DragonUITableView TABLEDIDSELECT]])//选中cell
    {
        
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
        WOShopDetailViewController *shop = [[WOShopDetailViewController alloc]init];
        [self.drNavigationController pushViewController:shop animated:YES];
        RELEASE(shop);
        
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
        [self.drNavigationController popViewControllerAnimated:YES];
    }else if ([signal is:[DYBBaseViewController NEXTSTEPBUTTON]]){
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
