//
//  WOSHomeViewController.m
//  DYiBan
//
//  Created by tom zeng on 13-12-4.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "WOSHomeViewController.h"
#import "WOSGoodFoodViewController.h"
#import "WOSALLOrderViewController.h"
#import "WOSPersonInfoViewController.h"
#import "LLSplitViewController.h"
#import "WOSGoodPriceViewController.h"
#import "WOSMapViewController.h"
#import "WOSThinkYouLikeViewController.h"
#import "WOSFindFoodViewController.h"

@interface WOSHomeViewController (){
    SGFocusImageFrame *bannerView;
    UIScrollView *scrollView;
}

@end

@implementation WOSHomeViewController

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
        [self.headview setTitle:@"极食客"];
        
        [self.leftButton setHidden:YES];
        [self setButtonImage:self.rightButton setImage:@"account"];
//        [self.imageViewHead setImage:[UIImage imageNamed:@"top"]];
//        [self.headview setBackgroundColor:[UIColor grayColor]];
        
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        
        [self.view setBackgroundColor:[UIColor colorWithRed:61.0f/255 green:61.0f/255  blue:61.0f/255  alpha:1.0f]];
        DYBUITabbarViewController *tabBatC = [DYBUITabbarViewController sharedInstace];
        
        [tabBatC hideTabBar:YES animated:NO];
                

    }
    else if ([signal is:[MagicViewController CREATE_VIEWS]]) {
        
        
       scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, .0f, 320, self.view.frame.size.height )];
        [self.view addSubview:scrollView];
        RELEASE(scrollView);
        
        [self.rightButton setHidden:YES];
        
        [self.view setBackgroundColor:[UIColor clearColor]];
        
        [self creatBanner];
        
        UIImage *imageGoodFood = [UIImage imageNamed:@"list.png"];
        UIButton *btnGoodFood = [[UIButton alloc]initWithFrame:CGRectMake((320 - imageGoodFood.size.width/2)/2, CGRectGetHeight(bannerView.frame) + CGRectGetMinY(bannerView.frame) + 5 , imageGoodFood.size.width/2, imageGoodFood.size.height/2)];
//        [btnGoodFood setTitle:@"美食大全" forState:UIControlStateNormal];
        [btnGoodFood addTarget:self action:@selector(goodFood) forControlEvents:UIControlEventTouchUpInside];
        [btnGoodFood setImage:imageGoodFood forState:UIControlStateNormal];
        [btnGoodFood setImage:imageGoodFood forState:UIControlStateHighlighted];
        [scrollView addSubview:btnGoodFood];
        RELEASE(btnGoodFood);
                
        
        UIImage *imageGoodPrice = [UIImage imageNamed:@"discount"];
        UIButton *btnGoodPrice = [[UIButton alloc]initWithFrame:CGRectMake(8, CGRectGetHeight(btnGoodFood.frame) + CGRectGetMinY(btnGoodFood.frame) + 5 , imageGoodPrice.size.width/2, imageGoodPrice.size.height/2)];
        //        [btnGoodFood setTitle:@"美食大全" forState:UIControlStateNormal];
        [btnGoodPrice setImage:imageGoodPrice forState:UIControlStateNormal];
        [btnGoodPrice setImage:imageGoodPrice forState:UIControlStateHighlighted];
        [btnGoodPrice addTarget:self action:@selector(goodPrice) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:btnGoodPrice];
        RELEASE(btnGoodPrice);
        
        
        UIImage *imageGoodMap = [UIImage imageNamed:@"map"];
        UIButton *btnGoodMap = [[UIButton alloc]initWithFrame:CGRectMake( CGRectGetWidth(btnGoodPrice.frame) + 8 + 7, CGRectGetHeight(btnGoodFood.frame) + CGRectGetMinY(btnGoodFood.frame) + 5 , imageGoodMap.size.width/2, imageGoodMap.size.height/2)];
        //        [btnGoodFood setTitle:@"美食大全" forState:UIControlStateNormal];
        [btnGoodMap addTarget:self action:@selector(mapViewController) forControlEvents:UIControlEventTouchUpInside];

        [btnGoodMap setImage:imageGoodMap forState:UIControlStateNormal];
        [btnGoodMap setImage:imageGoodMap forState:UIControlStateHighlighted];
        [scrollView addSubview:btnGoodMap];
        RELEASE(btnGoodMap);
        
        UIImage *imageGoodTuiJian = [UIImage imageNamed:@"recommend"];
        UIButton *btnGoodTuiJian = [[UIButton alloc]initWithFrame:CGRectMake( CGRectGetWidth(btnGoodPrice.frame) + 8 + 7, CGRectGetHeight(btnGoodMap.frame) + CGRectGetMinY(btnGoodMap.frame) + 5 , imageGoodTuiJian.size.width/2, imageGoodTuiJian.size.height/2)];
        //        [btnGoodFood setTitle:@"美食大全" forState:UIControlStateNormal];
        [btnGoodTuiJian setImage:imageGoodTuiJian forState:UIControlStateNormal];
        [btnGoodTuiJian setImage:imageGoodTuiJian forState:UIControlStateHighlighted];
        [scrollView addSubview:btnGoodTuiJian];
        RELEASE(btnGoodTuiJian);
        
        
        UIImage *imageGoodSearch = [UIImage imageNamed:@"search"];
        UIButton *btnGoodSearch = [[UIButton alloc]initWithFrame:CGRectMake( CGRectGetWidth(btnGoodPrice.frame) + 8 + 7 + CGRectGetWidth(btnGoodTuiJian.frame) + 5 + 3  , CGRectGetHeight(btnGoodMap.frame) + CGRectGetMinY(btnGoodMap.frame) + 5 , imageGoodSearch.size.width/2, imageGoodSearch.size.height/2)];
        [btnGoodSearch addTarget:self action:@selector(searchFood) forControlEvents:UIControlEventTouchUpInside];
        //        [btnGoodFood setTitle:@"美食大全" forState:UIControlStateNormal];
        [btnGoodSearch setImage:imageGoodSearch forState:UIControlStateNormal];
        [btnGoodSearch setImage:imageGoodSearch forState:UIControlStateHighlighted];
        [scrollView addSubview:btnGoodSearch];
        RELEASE(btnGoodSearch);
        
        
        UIImage *imageYouLike = [UIImage imageNamed:@"guess"];
        UIButton *btnYouLike = [[UIButton alloc]initWithFrame:CGRectMake( 8 , CGRectGetHeight(btnGoodPrice.frame) + CGRectGetMinY(btnGoodPrice.frame) + 5 , imageYouLike.size.width/2, imageYouLike.size.height/2)];
        //        [btnGoodFood setTitle:@"美食大全" forState:UIControlStateNormal];
        [btnYouLike addTarget:self action:@selector(youlike) forControlEvents:UIControlEventTouchUpInside];
        [btnYouLike setImage:imageYouLike forState:UIControlStateNormal];
        [btnYouLike setImage:imageYouLike forState:UIControlStateHighlighted];
        [scrollView addSubview:btnYouLike];
        RELEASE(btnYouLike);
        
        UIImage *imageNear = [UIImage imageNamed:@"nearby"];
        UIButton *btnNear = [[UIButton alloc]initWithFrame:CGRectMake( 8  , CGRectGetHeight(btnYouLike.frame) + CGRectGetMinY(btnYouLike.frame) + 5 , imageNear.size.width/2, imageNear.size.height/2)];
        //        [btnGoodFood setTitle:@"美食大全" forState:UIControlStateNormal];
        [btnNear addTarget:self action:@selector(nearby) forControlEvents:UIControlEventTouchUpInside];

        [btnNear setImage:imageNear forState:UIControlStateNormal];
        [btnNear setImage:imageNear forState:UIControlStateHighlighted];
        [scrollView addSubview:btnNear];
        RELEASE(btnNear);
        
        UIImage *imagePeople = [UIImage imageNamed:@"nearbypeople"];
        UIButton *btnPeople = [[UIButton alloc]initWithFrame:CGRectMake( CGRectGetWidth(btnGoodPrice.frame) + 8 + 7  , CGRectGetHeight(btnGoodSearch.frame) + CGRectGetMinY(btnGoodSearch.frame) + 5 , imagePeople.size.width/2, imagePeople.size.height/2)];
        //        [btnGoodFood setTitle:@"美食大全" forState:UIControlStateNormal];
        [btnPeople addTarget:self action:@selector(nearbyPeople) forControlEvents:UIControlEventTouchUpInside];
        [btnPeople setImage:imagePeople forState:UIControlStateNormal];
        [btnPeople setImage:imagePeople forState:UIControlStateHighlighted];
        [scrollView addSubview:btnPeople];
        RELEASE(btnPeople);
        
        
        [scrollView setContentSize:CGSizeMake(320.0f, CGRectGetHeight(btnPeople.frame) + CGRectGetMinY(btnPeople.frame) + 20 )];
    }
    
    
    else if ([signal is:[MagicViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[MagicViewController DID_DISAPPEAR]]){
        
        
    }
}

-(void)creatBanner{
    
    //添加最后一张图 用于循环
    int length = 4;
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0 ; i < length; i++)
    {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"title%d",i],@"title" ,nil];
        [tempArray addObject:dict];
    }
    
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:length+2];
    if (length > 1)
    {
        NSDictionary *dict = [tempArray objectAtIndex:length-1];
        SGFocusImageItem *item = [[[SGFocusImageItem alloc] initWithDict:dict tag:-1] autorelease];
        [itemArray addObject:item];
    }
    for (int i = 0; i < length; i++)
    {
        NSDictionary *dict = [tempArray objectAtIndex:i];
        SGFocusImageItem *item = [[[SGFocusImageItem alloc] initWithDict:dict tag:i] autorelease];
        [itemArray addObject:item];
        
    }
    //添加第一张图 用于循环
    if (length >1)
    {
        NSDictionary *dict = [tempArray objectAtIndex:0];
        SGFocusImageItem *item = [[[SGFocusImageItem alloc] initWithDict:dict tag:length] autorelease];
        [itemArray addObject:item];
    }
    
//    [arrayResultTitle];
    NSMutableArray *arrayResultTitle = [[NSMutableArray alloc]init];
    [arrayResultTitle addObject:@"eee"];
    [arrayResultTitle addObject:@"4444"];
    [arrayResultTitle addObject:@"3333"];
    [arrayResultTitle addObject:@"6666"];
    
    
    NSMutableArray *arrayImage = [[NSMutableArray alloc]init];
    [arrayImage addObject:@"flash.png"];
    [arrayImage addObject:@"flash.png"];
    [arrayImage addObject:@"flash.png"];
    [arrayImage addObject:@"flash.png"];
    
    UIImage *image = [UIImage imageNamed:@"flash.png"];
    
    bannerView = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake((320-  image.size.width/2)/2, 44 + 5, image.size.width/2, image.size.height/2) delegate:self imageItems:itemArray isAuto:NO arrayStringTotal:arrayResultTitle arrayImage:arrayImage];
//    [bannerView setCenter:CGPointMake(160.0f, 100)];
//    [bannerView setArrayImage:arrayImage];
    [bannerView scrollToIndex:0];
    [scrollView addSubview:bannerView];
    [bannerView release];
    RELEASE(arrayImage);
    
}
-(void)goodPrice{

    WOSGoodPriceViewController *good = [[WOSGoodPriceViewController alloc]init];
    [self.drNavigationController pushViewController:good animated:YES];
    RELEASE(good);

}

-(void)goodFood{

    LLSplitViewController *goodFood = [LLSplitViewController getmainController];
    [self.drNavigationController pushViewController:goodFood animated:YES];
    RELEASE(goodFood);

}

-(void)mapViewController{

    WOSMapViewController *map = [[WOSMapViewController alloc]init];
    map.iType = 0;
    [self.drNavigationController pushViewController:map animated:YES];
    RELEASE(map);
}

-(void)youlike{
    WOSThinkYouLikeViewController *like = [[WOSThinkYouLikeViewController alloc]init];
    [self.drNavigationController pushViewController:like animated:YES];
    RELEASE(like);
}

-(void)nearby{
    
    WOSMapViewController *map = [[WOSMapViewController alloc]init];
    map.iType = 1;
    [self.drNavigationController pushViewController:map animated:YES];
    RELEASE(map);

}

-(void)nearbyPeople{

    WOSMapViewController *map = [[WOSMapViewController alloc]init];
    map.iType = 2;
    [self.drNavigationController pushViewController:map animated:YES];
    RELEASE(map);
}

-(void)searchFood{

    WOSFindFoodViewController *find = [[WOSFindFoodViewController alloc]init];
    [self.drNavigationController pushViewController:find animated:YES];
    RELEASE(find);

}

- (void)handleViewSignal_DYBBaseViewController:(MagicViewSignal *)signal
{
    if ([signal is:[DYBBaseViewController BACKBUTTON]])
    {
//        DYBUITabbarViewController *dync = [DYBUITabbarViewController sharedInstace];
//        [dync scrollMainView:1];
    }else if ([signal is:[DYBBaseViewController NEXTSTEPBUTTON]]){
        //        DYBPublishViewController *vc = [[DYBPublishViewController alloc] init:nil activeid:nil bActive:NO];
        //        [self.drNavigationController pushViewController:vc animated:YES];
        //        RELEASE(vc);
        
        
        WOSPersonInfoViewController *person = [[WOSPersonInfoViewController alloc]init];
        [self.drNavigationController pushViewController:person animated:YES];
        RELEASE(person);
        
//        WOSALLOrderViewController *allOrder = [[WOSALLOrderViewController alloc]init];
//        [self.drNavigationController pushViewController:allOrder animated:YES];
//        RELEASE(allOrder);
        
    }
    
}

- (void)dealloc
{
    
    [super dealloc];
}
@end
