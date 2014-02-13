//
//  ShareMYHomeViewController.m
//  ShareBook
//
//  Created by tom zeng on 14-2-10.
//  Copyright (c) 2014年 Tomgg. All rights reserved.
//

#import "ShareMYHomeViewController.h"
#import "WOSOrderCell.h"
#import "DYBDataBankTopRightCornerView.h"
#import "ShareMessagerCell.h"
#import "ShareDouViewController.h"
#define  RIGHTVIEWTAG 111

@interface ShareMYHomeViewController ()

@end

@implementation ShareMYHomeViewController

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
        [self.headview setTitle:@"消息"];
        
//        [self setButtonImage:self.leftButton setImage:@"back"];
        [self.leftButton setHidden:YES];
        [self setButtonImage:self.rightButton setImage:@"menu"];
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
       [self.headview setBackgroundColor:[UIColor colorWithRed:17.0f/255 green:22.0f/255 blue:27.0f/255 alpha:1.0f]];
        
    }
    else if ([signal is:[MagicViewController CREATE_VIEWS]]) {
        
        [self.rightButton setHidden:YES];
//        arrayFoodList = [[NSArray alloc]init];
//        arrayAddorder = [[NSMutableArray alloc]init];
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
//        MagicRequest *request = [DYBHttpMethod wosKitchenInfo_foodlist:[_dictInfo objectForKey:@"kitchenIndex"]sAlert:YES receive:self];
//        [request setTag:3];
        
        UIView *viewBG = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 44, 320.0f, self.view.frame.size.height - 44)];
        [viewBG setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:viewBG];
        RELEASE(viewBG);
        
        
        UIImage *image = [UIImage imageNamed:@"menu_inactive"];
        
        
       DYBUITableView  *tbDataBank1 = [[DYBUITableView alloc]initWithFrame:CGRectMake(0, self.headHeight, 320.0f , self.view.frame.size.height - self.headHeight  ) isNeedUpdate:YES];
        [tbDataBank1 setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:tbDataBank1];
        [tbDataBank1 setSeparatorColor:[UIColor colorWithRed:78.0f/255 green:78.0f/255 blue:78.0f/255 alpha:1.0f]];
        RELEASE(tbDataBank1);
        
        
        
        
    }
    
    
    else if ([signal is:[MagicViewController DID_APPEAR]]) {
        
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
        
        ShareMessagerCell *cell = [[ShareMessagerCell alloc]init];
        
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


- (void)handleViewSignal_DYBBaseViewController:(MagicViewSignal *)signal
{
    if ([signal is:[DYBBaseViewController BACKBUTTON]])
    {
        [self.drNavigationController popViewControllerAnimated:YES];
        
    }else if ([signal is:[DYBBaseViewController NEXTSTEPBUTTON]]){
        
        
        UIView *viewR = [self.view viewWithTag:RIGHTVIEWTAG];
        if (!viewR) {
            
            NSArray *arrayType = [[NSArray alloc]initWithObjects:@"消息",@"图书",@"豆",@"圈", nil];
            DYBDataBankTopRightCornerView *rightV = [[DYBDataBankTopRightCornerView alloc]initWithFrame:CGRectMake(320.0f - 95, self.headHeight, 90, 99) arrayResult:arrayType target:self];
            [rightV setBackgroundColor:[UIColor clearColor]];
            [rightV setTag:RIGHTVIEWTAG];
            [self.view addSubview:rightV];
            RELEASE(rightV);
            RELEASE(arrayType);
            
        }else{
        
            viewR.hidden == YES ? [viewR setHidden:NO] : [viewR setHidden:YES];
        
        }
        
    }
}


- (void)handleViewSignal_DYBDataBankTopRightCornerView:(MagicViewSignal *)signal
{

    if ([signal is:[DYBDataBankTopRightCornerView TOUCHSINGLEBTN]]) {
        
        UIView *viewR = [self.view viewWithTag:RIGHTVIEWTAG];
        if (viewR) {
            [viewR setHidden:YES];
        }
        NSNumber *num = (NSNumber *)[signal object];
        
        switch ([num integerValue]) {
            case 1:
                
                break;
            case 2:
                
                break;
            case 3:
            {
                
                ShareDouViewController *dou = [[ShareDouViewController alloc]init];
//                [self.drNavigationController pushViewController:dou animated:YES];
//                RELEASE(dou);
            
                [self presentModalViewController:dou animated:NO];
                
            }
                break;
            case 4:
                
                break;
            default:
                break;
        }
        
//        ShareDouViewController
        
    }


}
#pragma mark- 只接受HTTP信号
//- (void)handleRequest:(MagicRequest *)request receiveObj:(id)receiveObj
//{
//    if ([request succeed])
//    {
//       
//    }
//}
@end
