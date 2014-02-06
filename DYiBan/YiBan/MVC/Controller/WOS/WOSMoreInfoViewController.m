//
//  WOSMoreInfoViewController.m
//  DYiBan
//
//  Created by tom zeng on 13-11-28.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "WOSMoreInfoViewController.h"
#import "Cell2.h"

@interface WOSMoreInfoViewController (){

    UITableView *tbDataBank1;
    NSArray *arrayTitle;

}

@end

@implementation WOSMoreInfoViewController

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
-(void)handleViewSignal_DragonViewController:(DragonViewSignal *)signal{
    
    DLogInfo(@"name -- %@",signal.name);
    
    if ([signal is:[DragonViewController LAYOUT_VIEWS]])
    {
        //        [self.rightButton setHidden:YES];
        [self.headview setTitle:@"更多"];
        
        //         [self setButtonImage:self.rightButton setImage:@"btn_more_def"];
        
        
    }
    else if ([signal is:[DragonViewController CREATE_VIEWS]]) {
        
        [self.rightButton setHidden:YES];
        
        [self.view setBackgroundColor:[UIColor clearColor]];
        
        arrayTitle = [[NSArray alloc]initWithObjects:@"告诉朋友",@"意见反馈",@"常用问题",@"关于",@"访问订餐网站", nil];

        tbDataBank1 = [[UITableView alloc]initWithFrame:CGRectMake(0.0f, SEARCHBAT_HIGH + 44, 320.0f, self.view.frame.size.height - SEARCHBAT_HIGH - 44 - 20 - 70 ) style:UITableViewStyleGrouped ];
        tbDataBank1.dataSource = self;
        tbDataBank1.delegate = self;
        [self.view addSubview:tbDataBank1];
        RELEASE(tbDataBank1);
        [tbDataBank1 setBackgroundColor:[UIColor clearColor]];
        
    }
    
    
    else if ([signal is:[DragonViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[DragonViewController DID_DISAPPEAR]]){
        
        
    }
}


#pragma mark - tableviewdelete
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section/*第一次回调时系统传的section是数据源里section数量的最大值-1*/
{
        
    
    return arrayTitle.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell2";
    Cell2 *cell = (Cell2*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (!cell) {
        cell = [[Cell2 alloc]init];
    }
    cell.titleLabel.text = [arrayTitle objectAtIndex:indexPath.row];
    
//    [signal setReturnValue:cell];

    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
            
        default:
            break;
    }
    
}




@end
