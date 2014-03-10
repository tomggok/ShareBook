//
//  JingDianMapCell.m
//  IYLM
//
//  Created by Jian-Ye on 12-11-8.
//  Copyright (c) 2012年 Jian-Ye. All rights reserved.
//

#import "JingDianMapCell.h"

@implementation JingDianMapCell
DEF_SIGNAL(TOUCHCELL)
@synthesize targetObjc;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self creatView];
    }
    return self;
}

-(void)creatView{

//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5.0f, 5.0f, 40.f, 40.f)];
//    [imageView setImage:[UIImage imageNamed:@"food1"]];
////    [self addSubview:imageView];
////    RELEASE(imageView);

    
    UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 120, 20)];
    [self addSubview:labelName];
    [labelName setText:@"人民广场"];
    RELEASE(labelName);
    
    UIImage *image  = [UIImage imageNamed:@"icon_pepole(1)"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(15.0f, 25.0f + 2+ 2, image.size.width/2, image.size.height/2)];
    [imageView setImage:[UIImage imageNamed:@"icon_book(1)"]];
    [self addSubview:imageView];
    RELEASE(imageView);
    
    UILabel *labelB = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageView.frame) + CGRectGetWidth(imageView.frame) + 5, 25, 20, 20)];
    [self addSubview:labelB];
    [labelB setText:@"19"];
    RELEASE(labelB);
    
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(labelB.frame) + CGRectGetWidth(labelB.frame) + 5 + 2, 25.0f + 2+ 2, image.size.width/2, image.size.height/2)];
    [imageView1 setImage:[UIImage imageNamed:@"icon_share(1)"]];
    [self addSubview:imageView1];
    RELEASE(imageView1);
    
    UILabel *labelS = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageView1.frame) + CGRectGetWidth(imageView1.frame) + 5, 25, 20, 20)];
    [self addSubview:labelS];
    [labelS setText:@"10"];
    RELEASE(labelS);
    
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(labelS.frame) + CGRectGetWidth(labelS.frame) + 5 + 2, 25.0f + 2+ 2, image.size.width/2, image.size.height/2)];

    [imageView2 setImage:[UIImage imageNamed:@"icon_pepole(1)"]];
    [self addSubview:imageView2];
    RELEASE(imageView2);
    
    UILabel *labelP = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageView2.frame) + CGRectGetWidth(imageView2.frame) + 5, 25, 20, 20)];
    [self addSubview:labelP];
    [labelP setText:@"12"];
    RELEASE(labelP);
    
    UILabel *labelPrice = [[UILabel alloc]initWithFrame:CGRectMake(45, 20 + 5, 100, 20)];
    [self addSubview:labelPrice];
    RELEASE(labelPrice);
//    [labelPrice setText:@"人均100"];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:self.frame];
    [btn addTarget:self action:@selector(dodo) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor clearColor]];
//    [self addSubview:btn];
//    RELEASE(btn)
    
}

-(void)dodo{
//    [[self superview] removeFromSuperview];
    NSLog(@"dodo");
    if (targetObjc) {
        [self sendViewSignal:[JingDianMapCell TOUCHCELL] withObject:self from:self target:targetObjc];
    }
    
}

- (void)dealloc
{
    
    [targetObjc release];
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
