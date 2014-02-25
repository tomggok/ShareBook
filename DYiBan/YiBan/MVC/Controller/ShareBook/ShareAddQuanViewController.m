//
//  ShareAddQuanViewController.m
//  ShareBook
//
//  Created by tom zeng on 14-2-24.
//  Copyright (c) 2014年 Tomgg. All rights reserved.
//

#import "ShareAddQuanViewController.h"
#import "DYBInputView.h"
#import "CALayer+Custom.h"



@interface ShareAddQuanViewController ()

@end

@implementation ShareAddQuanViewController

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
        [self.headview setTitle:@"添加圈子"];
        
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
        
        
        
        UIImageView *viewBG = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 44, 320.0f, self.view.frame.size.height - 44)];
        [viewBG setImage:[UIImage imageNamed:@"bg"]];
        [viewBG setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:viewBG];
        RELEASE(viewBG);
        
        
        
        UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, self.headHeight + 10, 100.0f, 40.0f)];
        [labelName setText:@"圈子名称："];
        [self.view addSubview:labelName];
        RELEASE(labelName);
        
        DYBInputView  *_phoneInputName = [[DYBInputView alloc]initWithFrame:CGRectMake(100,self.headHeight + 10, 200, 35) placeText:@"天山小区" textType:0];
        [_phoneInputName.layer AddborderByIsMasksToBounds:YES cornerRadius:3 borderWidth:1 borderColor:[[UIColor colorWithRed:188.0f/255 green:188.0f/255 blue:188.0f/255 alpha:1.0f] CGColor]];
        //        [_phoneInputName.nameField setText:@"1"];
        [_phoneInputName.nameField setTextColor:[UIColor blackColor]];
        [_phoneInputName setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:_phoneInputName];
        RELEASE(_phoneInputName);
        
        UILabel *labelJINWEI = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, CGRectGetHeight(_phoneInputName.frame) + CGRectGetMinY(_phoneInputName.frame), 250.0f, 40.0f)];
        [labelJINWEI setText:@"经纬度   ： -20.03，-113.75"];
        [self.view addSubview:labelJINWEI];
        RELEASE(labelJINWEI);
        
        
        UILabel *labelTime = [[UILabel alloc]initWithFrame:CGRectMake(10.0f, CGRectGetHeight(labelJINWEI.frame) + CGRectGetMinY(labelJINWEI.frame), 250.0f, 40.0f)];
        [labelTime setText:@"创建时间： 2014-02-10"];
        [self.view addSubview:labelTime];
        RELEASE(labelTime);
        
        
        UIImage *image = [UIImage imageNamed:@"bt_click1"];
        UIButton *btnOK = [[UIButton alloc]initWithFrame:CGRectMake(20.0f, CGRectGetHeight(labelTime.frame) + CGRectGetMinY(labelTime.frame) + 50, 280.0f, 40.0f)];
        [btnOK setTag:102];
        [btnOK setImage:image forState:UIControlStateNormal];
//        [btnOK setBackgroundColor:[UIColor yellowColor]];
        [btnOK addTarget:self action:@selector(doChoose) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnOK];
        RELEASE(btnOK);
        
        [self addlabel_title:@"创建圈子" frame:btnOK.frame view:btnOK];
        
               DYBUITableView * tbDataBank11 = [[DYBUITableView alloc]initWithFrame:CGRectMake(0,200 , 320.0f , self.view.frame.size.height -100 - 60 - 100  ) isNeedUpdate:YES];
        [tbDataBank11 setBackgroundColor:[UIColor whiteColor]];
//        [self.view addSubview:tbDataBank11];
        [tbDataBank11 setSeparatorColor:[UIColor colorWithRed:78.0f/255 green:78.0f/255 blue:78.0f/255 alpha:1.0f]];
//        RELEASE(tbDataBank11);
        
        
        
    }else if ([signal is:[MagicViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[MagicViewController DID_DISAPPEAR]]){
        
        
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


-(void)doChoose{


}


@end
