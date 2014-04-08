//
//  WOSMapViewController.m
//  DYiBan
//
//  Created by tom zeng on 13-12-25.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "JSONKit.h"
#import "JSON.h"
#import "WOSMapViewController.h"
#import "MapViewController.h"
#import "ShareBookMyQuanCenterViewController.h"
#import "ShareBookQuanDetailViewController.h"
#import "ShareAddQuanViewController.h"

@interface WOSMapViewController (){
    MapViewController*   _mapViewController;
    NSMutableArray *arrayResult;

}

@end

@implementation WOSMapViewController

@synthesize iType,dictMap = _dictMap ,bEnter = _bEnter;
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
        [self.headview setTitle:@"附近的圈子"];
        
    
        [self.headview setTitleColor:[UIColor colorWithRed:203.0f/255 green:203.0f/255 blue:203.0f/255 alpha:1.0f]];
        
        [self.view setBackgroundColor:[UIColor redColor]];

        [self setButtonImage:self.leftButton setImage:@"icon_retreat"];
        
        if (_bEnter) {
            
            [self.rightButton setHidden:YES];
            [self.headview setTitle:@"圈子"];
            
        }else{
        
            [self setButtonImage:self.rightButton setImage:@"icon_list"];
        }
        
    }
    else if ([signal is:[MagicViewController CREATE_VIEWS]]) {
        
        MagicRequest *request = [DYBHttpMethod shareBook_circle_list_sAlert:YES receive:self];
        [request setTag:3];
        
        
        
        
        for (int i = 0; i< 3; i ++) {
            
            UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0.0f + i*320/3 + i*1, 44.0f, 320/3, 30)];
            //            [btn1 setTitle:@"处理中" forState:UIControlStateNormal];
            [btn1.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [btn1 setTitleColor:ColorGryWhite forState:UIControlStateNormal];
            switch (i) {
                case 0:
                    [btn1 setTitle:@"我已吃过" forState:UIControlStateNormal];
                    if (iType == 0) {
                         [btn1 setTitleColor:ColorTextYellow forState:UIControlStateNormal];
                    }
                   
                    break;
                case 1:
                    [btn1 setTitle:@"附近美食" forState:UIControlStateNormal];
                    if (iType == 1) {
                        [btn1 setTitleColor:ColorTextYellow forState:UIControlStateNormal];
                    }
                    break;
                case 2:
                    [btn1 setFrame:CGRectMake(0.0f + i*320/3 + i *0.5 , 44.0f, 320/3, 30)];
                    [btn1 setTitle:@"附近的人在吃" forState:UIControlStateNormal];
                    if (iType == 2) {
                        [btn1 setTitleColor:ColorTextYellow forState:UIControlStateNormal];
                    }
                    break;
                    
                default:
                    break;
            }
            
            
            [btn1 setBackgroundColor:[UIColor blackColor]];
            [btn1 addTarget:self action:@selector(doSelect:) forControlEvents:UIControlEventTouchUpInside];
            [btn1 setTag:10 + i];
//            [self.view addSubview:btn1];
//            RELEASE(btn1);
        }
        
        int offset = 0;
        if (!IOS7_OR_LATER) {
            
            offset = 20;
        }
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(20.0f, CGRectGetHeight(self.view.frame) - 100 - offset, 280.0f, 44)];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setImage:[UIImage imageNamed:@"bt_click1"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(addQuan) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: btn];
        RELEASE(btn);
        [self addlabel_title:@"创建乐享圈" frame:btn.frame view:btn];
    }
    
    
    else if ([signal is:[MagicViewController DID_APPEAR]]) {
        
        
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

-(void)addQuan{

    ShareAddQuanViewController *add = [[ShareAddQuanViewController alloc]init];
    [self.drNavigationController pushViewController:add animated:YES];

    RELEASE(add);
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



- (void)customMKMapViewDidSelectedWithInfo:(id)info
{
    NSLog(@"%@",info);
    ShareBookQuanDetailViewController *detail = [[ShareBookQuanDetailViewController alloc]init];
    [self.drNavigationController pushViewController:detail animated:YES];
    RELEASE(detail);
}

//MapViewController TOUCHANNITION


- (void)handleViewSignal_MapViewController:(MagicViewSignal *)signal
{
    if ([signal is:[MapViewController TOUCHANNITION]]) {
        
        UIView *bb = (UIView *)[signal object];
        
        ShareBookQuanDetailViewController *detail = [[ShareBookQuanDetailViewController alloc]init];
        [self.drNavigationController pushViewController:detail animated:YES];
        RELEASE(detail);
    }

}

- (void)handleViewSignal_DYBBaseViewController:(MagicViewSignal *)signal
{
    if ([signal is:[DYBBaseViewController BACKBUTTON]])
    {
        [self.drNavigationController popViewControllerAnimated:YES];
    }else if ([signal is:[DYBBaseViewController NEXTSTEPBUTTON]]){
        
        ShareBookMyQuanCenterViewController *mapList = [[ShareBookMyQuanCenterViewController alloc]init];
        mapList.bEnter = YES;
        mapList.arrayResult = arrayResult;
        [mapList setTitle:@"附近的圈子"];
        [self.drNavigationController pushViewController:mapList animated:YES];
        RELEASE(mapList);
    }
}


#pragma mark- 只接受HTTP信号
- (void)handleRequest:(MagicRequest *)request receiveObj:(id)receiveObj
{
    
    if ([request succeed])
    {
        //        JsonResponse *response = (JsonResponse *)receiveObj;
        if (request.tag == 2) {
            
            
            NSDictionary *dict = [request.responseString JSONValue];
            
            if (dict) {
                
                if ([[dict objectForKey:@"response"] isEqualToString:@"100"]) {
                    
                   
                    
                }else{
                    NSString *strMSG = [dict objectForKey:@"message"];
                    
                    [DYBShareinstaceDelegate popViewText:strMSG target:self hideTime:.5f isRelease:YES mode:MagicPOPALERTVIEWINDICATOR];
                    
                    
                }
            }
        }else if(request.tag == 3){
            
            NSDictionary *dict = [request.responseString JSONValue];
            
            if (dict) {
                BOOL result = [[dict objectForKey:@"result"] boolValue];
                if (!result) {
                    
                    arrayResult  = [[NSMutableArray alloc]initWithArray:[[dict objectForKey:@"data"]objectForKey:@"list" ]];
                    
                    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:1000];
                    
                    for (NSDictionary *dictMap in arrayResult)
                    {
                    
                    NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:[dictMap objectForKey:@"lat"],@"latitude",[dictMap objectForKey:@"lng"],@"longitude",[dictMap objectForKey:@"circle_id"],@"circle_id",nil];
                        [array addObject:dic1];
                    }
                    
                    _mapViewController = [[MapViewController alloc] initWithFrame:CGRectMake(0.0f, 0 , 320.0f, self.view.bounds.size.height )];
                    _mapViewController.delegate = self;
                    _mapViewController.target = self;
                    [self.view insertSubview:_mapViewController atIndex:0];
                    [_mapViewController resetAnnitations:array];
                    
                
                    _mapViewController.arrayResuce = arrayResult;
                }
                else{
                    NSString *strMSG = [dict objectForKey:@"message"];
                    
                    [DYBShareinstaceDelegate popViewText:strMSG target:self hideTime:.5f isRelease:YES mode:MagicPOPALERTVIEWINDICATOR];
                    
                    
                }
            }
            
        } else{
            NSDictionary *dict = [request.responseString JSONValue];
            NSString *strMSG = [dict objectForKey:@"message"];
            
            [DYBShareinstaceDelegate popViewText:strMSG target:self hideTime:.5f isRelease:YES mode:MagicPOPALERTVIEWINDICATOR];
            
            
        }
    }
}


- (void)dealloc
{
    
    [super dealloc];
}

@end
