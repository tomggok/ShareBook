//
//  WOSThinkYouLikeViewController.m
//  DYiBan
//
//  Created by tom zeng on 14-1-10.
//  Copyright (c) 2014年 ZzL. All rights reserved.
//

#import "WOSThinkYouLikeViewController.h"
#import "WOSGoodFoodViewController.h"


@interface WOSThinkYouLikeViewController ()

@end

@implementation WOSThinkYouLikeViewController

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
        [self.headview setTitle:@"猜猜你喜欢"];
        
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        
        [self.view setBackgroundColor:ColorBG];
        [self setButtonImage:self.leftButton setImage:@"back"];
    }
    else if ([signal is:[DragonViewController CREATE_VIEWS]]) {
        
        UIImage *imageCHUAN = [UIImage imageNamed:@"chuan"];
        UIButton *btnCHUAN = [[UIButton alloc]initWithFrame:CGRectMake(20.0f, 44 + 20, imageCHUAN.size.width/2, imageCHUAN.size.height/2)];
        [btnCHUAN addTarget:self action:@selector(CHUAN) forControlEvents:UIControlEventTouchUpInside];
        [btnCHUAN setImage:imageCHUAN forState:UIControlStateNormal];
        [self.view addSubview:btnCHUAN];
        [btnCHUAN release];
        
        
        UIImage *imageAO = [UIImage imageNamed:@"ao"];
        UIButton *btnAO = [[UIButton alloc]initWithFrame:CGRectMake(20.0f + imageCHUAN.size.width/2 + 10, 44 + 20, imageAO.size.width/2, imageAO.size.height/2)];
        [btnAO addTarget:self action:@selector(AO) forControlEvents:UIControlEventTouchUpInside];
        [btnAO setImage:imageAO forState:UIControlStateNormal];
        [self.view addSubview:btnAO];
        [btnAO release];
        
        
        
        UIImage *imageMIAN = [UIImage imageNamed:@"mianbao"];
        UIButton *btnMIAN = [[UIButton alloc]initWithFrame:CGRectMake(20.0f, 44 + 10 + imageAO.size.height/2 + 20, imageCHUAN.size.width/2, imageCHUAN.size.height/2)];
        [btnMIAN addTarget:self action:@selector(MIAN) forControlEvents:UIControlEventTouchUpInside];
        [btnMIAN setImage:imageMIAN forState:UIControlStateNormal];
        [self.view addSubview:btnMIAN];
        [btnMIAN release];
        
        UIImage *imagePISA = [UIImage imageNamed:@"pisa"];
        UIButton *btnPISA = [[UIButton alloc]initWithFrame:CGRectMake(22.0f + imageCHUAN.size.width/2 + 10, 44 + 20 + imageAO.size.height/2 + 10, imagePISA.size.width/2, imagePISA.size.height/2)];
        [btnPISA addTarget:self action:@selector(PISA) forControlEvents:UIControlEventTouchUpInside];
        [btnPISA setImage:imagePISA forState:UIControlStateNormal];
        [self.view addSubview:btnPISA];
        [btnPISA release];
        
        
        
        UIImage *imageQUAN = [UIImage imageNamed:@"meisdaquan"];
        UIButton *btnQUAN = [[UIButton alloc]initWithFrame:CGRectMake(20.0f , 44 + 10 + imagePISA.size.height + 30, imageQUAN.size.width/2 + 5, imageQUAN.size.height/2 + 0)];
        [btnQUAN addTarget:self action:@selector(QUAN) forControlEvents:UIControlEventTouchUpInside];
        [btnQUAN setImage:imageQUAN forState:UIControlStateNormal];
        [self.view addSubview:btnQUAN];
        [btnQUAN release];
    }
    
    
    else if ([signal is:[DragonViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[DragonViewController DID_DISAPPEAR]]){
        
        
    }
}


-(void)CHUAN{

//    WOSGoodFoodViewController *good = [[WOSGoodFoodViewController alloc]init];
//    [self.drNavigationController pushViewController:good animated:YES];
//    RELEASE(good);


}

-(void)AO{

//    WOSGoodFoodViewController *good = [[WOSGoodFoodViewController alloc]init];
//    [self.drNavigationController pushViewController:good animated:YES];
//    RELEASE(good);

}

-(void)MIAN{

//    WOSGoodFoodViewController *good = [[WOSGoodFoodViewController alloc]init];
//    [self.drNavigationController pushViewController:good animated:YES];
//    RELEASE(good);

}

-(void)PISA{

//    WOSGoodFoodViewController *good = [[WOSGoodFoodViewController alloc]init];
//    [self.drNavigationController pushViewController:good animated:YES];
//    RELEASE(good);

}


-(void)QUAN{
//    WOSGoodFoodViewController *good = [[WOSGoodFoodViewController alloc]init];
//    [self.drNavigationController pushViewController:good animated:YES];
//    RELEASE(good);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
