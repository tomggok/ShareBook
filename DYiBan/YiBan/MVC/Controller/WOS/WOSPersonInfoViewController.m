//
//  WOSPersonInfoViewController.m
//  DYiBan
//
//  Created by tom zeng on 13-11-28.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "WOSPersonInfoViewController.h"
#import "WOSAddrViewController.h"
#import "WOSALLOrderViewController.h"
#import "WOSCollectViewController.h"
#import "WOSPersonInfoViewController.h"
#import "WOSPreferentialCardViewController.h"
#import "WOSMoreInfoViewController.h"
#import "Cell2.h"

@interface WOSPersonInfoViewController (){

    DYBUITableView *tbDataBank1;
    NSArray *arrayTitle;
}

@end

@implementation WOSPersonInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)handleViewSignal_DragonViewController:(DragonViewSignal *)signal{
    
    DLogInfo(@"name -- %@",signal.name);
    
    if ([signal is:[DragonViewController LAYOUT_VIEWS]])
    {
//        [self.rightButton setHidden:YES];
        [self.headview setTitle:@"个人中心"];
        
         [self setButtonImage:self.rightButton setImage:@"btn_more_def"];
        
                
    }
    else if ([signal is:[DragonViewController CREATE_VIEWS]]) {
        
        [self.rightButton setHidden:YES];
                
        [self.view setBackgroundColor:[UIColor clearColor]];
        
        arrayTitle = [[NSArray alloc]initWithObjects:@"全部订单",@"地址簿",@"收藏夹",@"电子优惠券",@"找回密码", nil];
        
        
        tbDataBank1 = [[DYBUITableView alloc]initWithFrame:CGRectMake(0.0f, SEARCHBAT_HIGH + 44, 320.0f, self.view.frame.size.height - SEARCHBAT_HIGH - 44 - 20 - 70 ) isNeedUpdate:YES];
        
        [tbDataBank1 setTableViewType:DTableViewSlime];
        [self.view addSubview:tbDataBank1];
        //        [tbDataBank setSeparatorColor:[UIColor clearColor]];
        RELEASE(tbDataBank1);

               
    }
    
    
    else if ([signal is:[DragonViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[DragonViewController DID_DISAPPEAR]]){
        
        
    }
}



- (void)handleViewSignal_DragonUITableView:(DragonViewSignal *)signal{
    
    
    if ([signal is:[DragonUITableView TABLENUMROWINSEC]])//numberOfRowsInSection
    {
        NSNumber *s = [NSNumber numberWithInteger:arrayTitle.count];
        [signal setReturnValue:s];
        
    }else if ([signal is:[DragonUITableView TABLENUMOFSEC]])//numberOfSectionsInTableView
    {
        NSNumber *s = [NSNumber numberWithInteger:1];
        [signal setReturnValue:s];
        
    }
    else if ([signal is:[DragonUITableView TABLEHEIGHTFORROW]])//heightForRowAtIndexPath
    {
        
        
        
        [signal setReturnValue:[NSNumber numberWithInteger:60]];
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
        UITableView *tableView = [dict objectForKey:@"tableView"];
          static NSString *CellIdentifier = @"Cell2";
        Cell2 *cell = (Cell2*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        if (!cell) {
            cell = [[Cell2 alloc]init];
        }
        cell.titleLabel.text = [arrayTitle objectAtIndex:indexPath.row];
        
        [signal setReturnValue:cell];
        
        
    }else if ([signal is:[DragonUITableView TABLEDIDSELECT]])//选中cell
    {
        
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
        switch (indexPath.row) {
            case 0:
            {
                WOSALLOrderViewController *order = [[WOSALLOrderViewController alloc]init];
                [self.drNavigationController pushViewController:order animated:YES];
                RELEASE(order);
            }
                break;
            case 1:
            {
                WOSAddrViewController *addr = [[WOSAddrViewController alloc]init];
                [self.drNavigationController pushViewController:addr animated:YES];
                RELEASE(addr);
            }
                break;
            case 2:
            {
                WOSCollectViewController *collect = [[WOSCollectViewController alloc]init];
                [self.drNavigationController pushViewController:collect animated:YES];
                RELEASE(collect);
            }
                break;
            case 3:
            {
                WOSPreferentialCardViewController *card = [[WOSPreferentialCardViewController alloc]init];
                [self.drNavigationController pushViewController:card animated:YES];
                RELEASE(card);
            }
                break;
            case 4:
            {
                
            }
                break;
                
            default:
                break;
        }
        
               
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
        WOSMoreInfoViewController *more = [[WOSMoreInfoViewController alloc]init];
        [self.drNavigationController pushViewController:more animated:YES];
        RELEASE(more);
    }
}
- (void)dealloc
{
    [arrayTitle release];
    [super dealloc];
}

@end
