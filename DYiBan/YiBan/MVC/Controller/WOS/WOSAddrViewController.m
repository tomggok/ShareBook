//
//  WOSAddrViewController.m
//  DYiBan
//
//  Created by tom zeng on 13-11-28.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "WOSAddrViewController.h"
#import "WOSAddrCell.h"
#import "WOSAddAddrViewController.h"


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
        [self.headview setTitle:@"送餐地址管理"];
        
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        
        [self.view setBackgroundColor:ColorBG];
        [self setButtonImage:self.leftButton setImage:@"back"];
    }
    else if ([signal is:[DragonViewController CREATE_VIEWS]]) {
        
        [self.view setBackgroundColor:[UIColor clearColor]];
        
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20.0f, 44 + 20 , 280,self.view.frame.size.height - 44 - 100 - 80)];
        UIImage *imageNew = [[UIImage imageNamed:@"text_area"] resizableImageWithCapInsets:UIEdgeInsetsMake(10.5, 10.5 , 10.5,10.5)];
        [imageView setImage:imageNew];
        [self.view addSubview:imageView];
        RELEASE(imageView);
        
       
        
        DragonUITableView *tableView = [[DragonUITableView alloc]initWithFrame:CGRectMake(20.0f, 44 + 20 , 280,self.view.frame.size.height - 44 - 100 - 80)];
        [tableView setBackgroundColor:[UIColor clearColor]];
        [tableView setSeparatorColor:[UIColor clearColor]];
        [self.view addSubview:tableView];
        RELEASE(tableView);
        
        UIButton *btnBack = [[UIButton alloc]initWithFrame:CGRectMake(10.0f, CGRectGetHeight(tableView.frame) + CGRectGetMinY(tableView.frame) + 20, 300, 44)];
        [btnBack addTarget:self action:@selector(addNewAddr) forControlEvents:UIControlEventTouchUpInside];
        [btnBack setBackgroundColor:[UIColor clearColor]];
         [self.view addSubview:btnBack];
        [btnBack release];
        [btnBack setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [self addlabel_title:@"添加地址" frame:btnBack.frame view:btnBack];
    }
    
    else if ([signal is:[DragonViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[DragonViewController DID_DISAPPEAR]]){
        
        
    }
}


-(void)addlabel_title:(NSString *)title frame:(CGRect)frame view:(UIView *)view{
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
    [label1 setText:title];
    [label1 setTag:100];
    [label1 setTextAlignment:NSTextAlignmentCenter];
    [view bringSubviewToFront:label1];
    [label1 setTextColor:[UIColor whiteColor]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [view addSubview:label1];
    RELEASE(label1);
    
}

-(void)addNewAddr{
    
    WOSAddAddrViewController *addAddr = [[WOSAddAddrViewController alloc]init];
    [self.drNavigationController pushViewController:addAddr animated:YES];
    RELEASE(addAddr);

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
        
        WOSAddrCell *cell = [[WOSAddrCell alloc]init];
        [cell setBackgroundColor:[UIColor colorWithRed:46/255 green:46/255 blue:46/255 alpha:1.0f]];

        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [signal setReturnValue:cell];
        
        
    }else if ([signal is:[DragonUITableView TABLEDIDSELECT]])//选中cell
    {
        
        return;
        
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
