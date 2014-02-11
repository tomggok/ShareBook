//
//  ShareBookBankViewController.m
//  ShareBook
//
//  Created by tom zeng on 14-2-10.
//  Copyright (c) 2014年 Tomgg. All rights reserved.
//

#import "ShareBookBankViewController.h"
#import "WOSOrderCell.h"
#import "ShareBookCell.h"
#import "ShareBookDetailViewController.h"
@interface ShareBookBankViewController (){
    
    UIScrollView *scrollView;

}

@end

@implementation ShareBookBankViewController

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
        [self.headview setTitle:@"图书"];
        
        [self setButtonImage:self.leftButton setImage:@"back"];
        [self setButtonImage:self.rightButton setImage:@"home"];
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        [self.headview setBackgroundColor:[UIColor colorWithRed:97.0f/255 green:97.0f/255 blue:97.0f/255 alpha:1.0]];
        
    }
    else if ([signal is:[MagicViewController CREATE_VIEWS]]) {
        
        [self.rightButton setHidden:YES];
      
        [self.view setBackgroundColor:[UIColor blackColor]];
        
 
        
        UIView *viewBG = [[UIView alloc]initWithFrame:CGRectMake(0.0f, self.headHeight , 320.0f, self.view.frame.size.height - self.headHeight)];
        [viewBG setBackgroundColor:[UIColor blackColor]];
        [self.view addSubview:viewBG];
        RELEASE(viewBG);
        
        NSArray *arraySouce  = [NSArray arrayWithObjects:@"全部",@"少儿",@"科技",@"其他",@"全部",@"少儿",@"科技",@"其他", nil];
        
        [self creatSelectType:arraySouce];
        
        UIImage *image = [UIImage imageNamed:@"menu_inactive"];
        
        
       DYBUITableView * tbDataBank11 = [[DYBUITableView alloc]initWithFrame:CGRectMake(0, self.headHeight + 44, 320.0f, self.view.frame.size.height - self.headHeight  ) isNeedUpdate:YES];
        [tbDataBank11 setBackgroundColor:[UIColor blackColor]];
        [self.view addSubview:tbDataBank11];
        [tbDataBank11 setSeparatorColor:[UIColor colorWithRed:78.0f/255 green:78.0f/255 blue:78.0f/255 alpha:1.0f]];
        RELEASE(tbDataBank11);
        
        
    
    }else if ([signal is:[MagicViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[MagicViewController DID_DISAPPEAR]]){
        
        
    }
}

-(void)creatSelectType:(NSArray *)arraySource{

    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, self.headHeight, 320/5 * 4, 44)];
    [self.view addSubview:scrollView];
    [scrollView release];
    
    UIButton *btnMore = [[UIButton alloc]initWithFrame:CGRectMake(320/5 * 4, self.headHeight, 320/5, 44)];
    [btnMore setBackgroundColor:[UIColor blueColor]];
    [btnMore addTarget:self action:@selector(doMore) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnMore];
    [btnMore release];
    
    int offset = 320/5;
    for (int i = 0; i < arraySource.count; i++) {
        
        UIButton *btnTouchType = [[UIButton alloc]initWithFrame:CGRectMake(i * offset, 0, offset, 44)];
       
        i%2 == 0 ? [btnTouchType setBackgroundColor:[UIColor redColor]]:[btnTouchType setBackgroundColor:[UIColor yellowColor]];
        [btnTouchType setTag:10 + i];
        [btnTouchType addTarget:self action:@selector(doChoose:) forControlEvents:UIControlEventTouchUpInside];
        [btnTouchType setTitle:[arraySource objectAtIndex:i] forState:UIControlStateNormal];
        [scrollView addSubview:btnTouchType];
        [btnTouchType release];
        
    }
    [scrollView setContentSize:CGSizeMake(offset * arraySource.count, 44)];
}

-(void)doChoose:(id)sender{



}

-(void)doMore{
    
    [UIView animateWithDuration:0.4 animations:^{
      [scrollView setContentOffset:CGPointMake(320/5 * 2, 0)];
    }];
  

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
        
        NSNumber *s = [NSNumber numberWithInteger:90];
        [signal setReturnValue:s];
        
        
    }else if([signal is:[MagicUITableView TABLETITLEFORHEADERINSECTION]])/*titleForHeaderInSection*/{
        
    }else if([signal is:[MagicUITableView TABLEVIEWFORHEADERINSECTION]])/*viewForHeaderInSection*/{
        
    }else if([signal is:[MagicUITableView TABLETHEIGHTFORHEADERINSECTION]])/*heightForHeaderInSection*/{
        
    }else if([signal is:[MagicUITableView TABLECELLFORROW]])/*cell*/{
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
        ShareBookCell *cell = [[ShareBookCell alloc]init];
        
//        NSDictionary *dictInfoFood = nil;
//        [cell creatCell:dictInfoFood];
        DLogInfo(@"%d", indexPath.section);
        
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [signal setReturnValue:cell];
        
    }else if([signal is:[MagicUITableView TABLEDIDSELECT]])/*选中cell*/{
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
        ShareBookDetailViewController *bookDetail = [[ShareBookDetailViewController alloc]init];
        [self.drNavigationController pushViewController:bookDetail animated:YES];
        RELEASE(bookDetail);
        
        
    }else if([signal is:[MagicUITableView TABLESCROLLVIEWDIDSCROLL]])/*滚动*/{
        
    }else if ([signal is:[MagicUITableView TABLEVIEWUPDATA]]){
        
        
    }else if ([signal is:[MagicUITableView TAbLEVIEWLODATA]]){
    }else if ([signal is:[MagicUITableView TAbLEVIERETOUCH]]){
        
    }
    
    
    
}



- (void)handleViewSignal_DYBBaseViewController:(MagicViewSignal *)signal
{
    if ([signal is:[DYBBaseViewController BACKBUTTON]])
    {
        [self.drNavigationController popViewControllerAnimated:YES];
        
    }else if ([signal is:[DYBBaseViewController NEXTSTEPBUTTON]]){
        
    }
}
#pragma mark- 只接受HTTP信号
- (void)handleRequest:(MagicRequest *)request receiveObj:(id)receiveObj
{
    if ([request succeed])
    {
        
        
    }
}
@end
