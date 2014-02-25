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

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5.0f, 5.0f, 40.f, 40.f)];
    [imageView setImage:[UIImage imageNamed:@"food1"]];
//    [self addSubview:imageView];
//    RELEASE(imageView);

    
    UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(45, 5, 120, 20)];
    [self addSubview:labelName];
    
    RELEASE(labelName);
    [labelName setText:@"人民广场"];
    
    UILabel *labelPrice = [[UILabel alloc]initWithFrame:CGRectMake(45, 20 + 5, 100, 20)];
    [self addSubview:labelPrice];
    RELEASE(labelPrice);
//    [labelPrice setText:@"人均100"];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:self.frame];
    [btn addTarget:self action:@selector(dodo) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor clearColor]];
    [self addSubview:btn];
    RELEASE(btn)
    
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
