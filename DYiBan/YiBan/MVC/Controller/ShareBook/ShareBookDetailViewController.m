//
//  ShareBookDetailViewController.m
//  ShareBook
//
//  Created by tom zeng on 14-2-11.
//  Copyright (c) 2014年 Tomgg. All rights reserved.
//

#import "ShareBookDetailViewController.h"
#import "Magic_UITableView.h"
#import "WOSOrderCell.h"

@interface ShareBookDetailViewController ()

@end

@implementation ShareBookDetailViewController

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
        [self.headview setTitle:@"图书详情"];
        
        [self setButtonImage:self.leftButton setImage:@"back"];
        [self setButtonImage:self.rightButton setImage:@"home"];
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        [self.headview setBackgroundColor:[UIColor colorWithRed:97.0f/255 green:97.0f/255 blue:97.0f/255 alpha:1.0]];
        
    }
    else if ([signal is:[MagicViewController CREATE_VIEWS]]) {
        
        [self.rightButton setHidden:YES];
        
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
        
        
        UIView *viewBG = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 44, 320.0f, self.view.frame.size.height - 44)];
        [viewBG setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:viewBG];
        RELEASE(viewBG);
        
        
        [self creatDetailView];
        
        UIImage *image = [UIImage imageNamed:@"menu_inactive"];
        
        
        DYBUITableView * tbDataBank11 = [[DYBUITableView alloc]initWithFrame:CGRectMake(0, 44 + 100 + 120, 320.0f, self.view.frame.size.height -44-100  ) isNeedUpdate:YES];
        [tbDataBank11 setBackgroundColor:[UIColor blackColor]];
        [self.view addSubview:tbDataBank11];
        [tbDataBank11 setSeparatorColor:[UIColor colorWithRed:78.0f/255 green:78.0f/255 blue:78.0f/255 alpha:1.0f]];
        RELEASE(tbDataBank11);
        
        
        
    }else if ([signal is:[MagicViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[MagicViewController DID_DISAPPEAR]]){
        
        
    }
}

-(void)creatDetailView{

    UIImageView *imageIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5.0f, 5.0f + self.headHeight, 100, 160.0f)];
    [imageIcon setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:imageIcon];
    [imageIcon release];
    
    UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageIcon.frame) + CGRectGetWidth(imageIcon.frame), 5.0f + self.headHeight, 100, 20)];
    [labelName setText:@"太空旅行"];
    [self.view addSubview:labelName];
    [labelName release];
    
    UILabel *labelAuther = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageIcon.frame) + CGRectGetWidth(imageIcon.frame), CGRectGetHeight(labelName.frame) + CGRectGetMinY(labelName.frame), 100, 20)];
    [labelAuther setFont:[UIFont systemFontOfSize:13]];
    [labelAuther setText:[NSString stringWithFormat:@"作者：空俊"]];
    [self.view addSubview:labelAuther];
    [labelAuther release];
    
    
    UILabel *labelPublic = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageIcon.frame) + CGRectGetWidth(imageIcon.frame), CGRectGetHeight(labelAuther.frame) + CGRectGetMinY(labelAuther.frame), 100, 20)];
    [labelPublic setText:[NSString stringWithFormat:@"出版社：科学发展出版社"]];
    [labelPublic setFont:[UIFont systemFontOfSize:13]];
    [self.view addSubview:labelPublic];
    [labelPublic release];
    
    
    UILabel *labelTime = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageIcon.frame) + CGRectGetWidth(imageIcon.frame), CGRectGetHeight(labelPublic.frame) + CGRectGetMinY(labelPublic.frame), 100, 20)];
    [labelTime setText:@"借书时间：2014 -01 -03"];
    [labelTime setFont:[UIFont systemFontOfSize:13]];
    [self.view addSubview:labelTime];
    [labelTime release];
    
    
    UILabel *labelMon = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageIcon.frame) + CGRectGetWidth(imageIcon.frame), CGRectGetHeight(labelTime.frame) + CGRectGetMinY(labelTime.frame), 100, 20)];
    [labelMon setText:@"押金：20乐享豆"];
    [labelMon setFont:[UIFont systemFontOfSize:13]];
    [self.view addSubview:labelMon];
    [labelMon release];
    
    
    UILabel *labelType = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageIcon.frame) + CGRectGetWidth(imageIcon.frame), CGRectGetHeight(labelMon.frame) + CGRectGetMinY(labelMon.frame), 100, 20)];
    [labelType setText:@"做客"];
    [labelType setFont:[UIFont systemFontOfSize:13]];
    [self.view addSubview:labelType];
    [labelType release];
    
    UILabel *labelModle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageIcon.frame) + CGRectGetWidth(imageIcon.frame), CGRectGetHeight(labelType.frame) + CGRectGetMinY(labelType.frame), 100, 20)];
    [labelModle setText:@"可以借阅"];
    [labelModle setFont:[UIFont systemFontOfSize:13]];
    
    [self.view addSubview:labelModle];
    [labelModle release];
    
    
    

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
        
        WOSOrderCell *cell = [[WOSOrderCell alloc]init];
        
        NSDictionary *dictInfoFood = nil;
        [cell creatCell:dictInfoFood];
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



@end
