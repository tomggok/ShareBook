//
//  DYBDataBankTopRightCornerView.m
//  DYiBan
//
//  Created by tom zeng on 13-9-4.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "DYBDataBankTopRightCornerView.h"
#define BTNWIDTH        90
#define BTNTAG          99
#define MINIMAGEVIEWTAG 199
#define HIGHIMG         8

@implementation DYBDataBankTopRightCornerView
@synthesize arrayResult = _arrayResult,targetObj = _targetObj;

DEF_SIGNAL(TOUCHBTN)
DEF_SIGNAL(TOUCHSINGLEBTN)


- (id)initWithFrame:(CGRect)frame arrayResult:(NSArray *)result target:(id)target
{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, BTNWIDTH, 88)]; //最少有2个 button
    _targetObj = target;
    if (self) {
        // Initialization code
        [self initViewArrayResult:result];
    }
    return self;
}

-(void)initViewArrayResult:(NSArray *)result{

    UIImageView *topView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0, BTNWIDTH, HIGHIMG)];
    
    [self addSubview:topView];
    RELEASE(topView);
    [topView setImage:[UIImage imageNamed:@"rightslide_top"]];
    
    UIImageView *minView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, HIGHIMG, BTNWIDTH, 88)];
    [minView setTag:MINIMAGEVIEWTAG];
    [minView setUserInteractionEnabled:YES];
    [minView setImage:[UIImage imageNamed:@"rightslide_mid"]];
    [self addSubview:minView];
    RELEASE(minView);
    
    int offset = 44;
    for (int i = 1; i <= result.count; i++) {
        
        MagicUIButton *btn = [[MagicUIButton alloc]initWithFrame:CGRectMake( 0, offset * (i - 1) + HIGHIMG, BTNWIDTH, 44)];
        
        [btn addSignal:[DYBDataBankTopRightCornerView TOUCHBTN] forControlEvents:UIControlEventTouchUpInside object:btn];
        [btn setTag:102];
        [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"rightslide_sel"] forState:UIControlStateSelected];
        [btn setTag:i];
        [minView addSubview:btn];
        RELEASE(btn);
        
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0.0f, btn.frame.size.width,btn.frame.size.height)];
        [btn addSubview:label];
        [label setText:[result objectAtIndex:i - 1]];
        [label setTag:BTNTAG];
        [label setTextAlignment:NSTextAlignmentLeft];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextAlignment:NSTextAlignmentCenter];

        RELEASE(label);
        
        if (i == 1) {
            [btn setSelected:YES];
            [label setTextColor:ColorBlue];
        }else{
            [btn setSelected:NO];
            [label setTextColor:[UIColor whiteColor]];
        
        }
        
        UIImage *image=[UIImage imageNamed:@"icon_book2"];
//        UIImage *image = [UIImage image];
        UIButton *imageIcon = [[UIButton alloc]initWithFrame:CGRectMake(8.0f, (44 - image.size.height/2 )/2, image.size.width/2,image.size.height/2)];
        [imageIcon setTag:101];
        [imageIcon setBackgroundColor:[UIColor clearColor]];
        [btn addSubview:imageIcon];
        [imageIcon release];
        
        
        
        if (i == 1) {
            [btn setSelected:YES];
            [imageIcon setSelected:NO];
            [label setTextColor:ColorBlue];
        }else{
            [btn setSelected:NO];
            [imageIcon setSelected:YES];
            [label setTextColor:[UIColor whiteColor]];
            
        }

        switch (i) {
            case 1:
                [imageIcon setImage:[UIImage imageNamed:@"icon_message_2"] forState:UIControlStateSelected];
                [imageIcon setImage:[UIImage imageNamed:@"icon_message_2"] forState:UIControlStateHighlighted];
                [imageIcon setImage:[UIImage imageNamed:@"icon_message"] forState:UIControlStateNormal];
                break;
            case 2:
                [imageIcon setImage:[UIImage imageNamed:@"icon_book"]forState:UIControlStateSelected];
                [imageIcon setImage:[UIImage imageNamed:@"icon_book2"] forState:UIControlStateNormal];
                [imageIcon setImage:[UIImage imageNamed:@"icon_book"] forState:UIControlStateHighlighted];
                break;

            case 3:
                [imageIcon setImage:[UIImage imageNamed:@"icon_beans"] forState:UIControlStateSelected];
                [imageIcon setImage:[UIImage imageNamed:@"icon_beans"] forState:UIControlStateHighlighted];
                [imageIcon setImage:[UIImage imageNamed:@"icon_beans_2"]forState:UIControlStateNormal];
                                break;

            case 4:
                [imageIcon setImage:[UIImage imageNamed:@"icon_circle"] forState:UIControlStateHighlighted];
                [imageIcon setImage:[UIImage imageNamed:@"icon_circle"] forState:UIControlStateSelected];
                [imageIcon setImage:[UIImage imageNamed:@"icon_circle_2"]forState:UIControlStateNormal];
                
                break;

                
            default:
                break;
        }
    }

    [minView setFrame:CGRectMake(0.0f, HIGHIMG,BTNWIDTH ,offset * result.count + HIGHIMG)]; //重新设置minview 高度

    UIImageView *footView = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, minView.frame.origin.y + minView.frame.size.height, BTNWIDTH, HIGHIMG)];
    [footView setImage:[UIImage imageNamed:@"rightslide_foot"]];
    [self addSubview:footView];
    RELEASE(footView);
    
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, BTNWIDTH, footView.frame.origin.y + footView.frame.size.height)];
    
    
}

-(void)handleViewSignal_DYBDataBankTopRightCornerView:(MagicViewSignal *)signal{

    if ([signal is:[DYBDataBankTopRightCornerView TOUCHBTN]]) {
               DLogInfo(@"test");
        MagicUIButton *btn = (MagicUIButton *)[signal object];
        int tag = btn.tag;
        
        [self setOPeartion:tag];
               
        [self sendViewSignal:[DYBDataBankTopRightCornerView TOUCHSINGLEBTN] withObject:[NSNumber numberWithInt:tag] from:self target:_targetObj]; //发送信号 给上层
    }
}

-(void)setFirstBtn{

    [self setOPeartion:1];
}

-(void)setOPeartion:(int)tag{


    UIImageView *minView = (UIImageView *)[self viewWithTag:MINIMAGEVIEWTAG];
    UIButton *selBtn = (UIButton *)[minView viewWithTag:102];
    for (UIView *view in [minView subviews]) {
    
        if ([view isKindOfClass:[UIButton class]]) {
    
            UIButton *selBtn = (UIButton *)view;
            
            UILabel *label = (UILabel *)[selBtn viewWithTag:BTNTAG];
            if (label) {
                
                UIButton *btnIcon = (UIButton *)[selBtn viewWithTag:101];
                if (tag == selBtn.tag ) {
                    
                    [selBtn setSelected:YES];
                    [btnIcon setSelected:NO];
                    [label setTextColor:ColorBlue];
                }else{
                    
                    [selBtn setSelected:NO];
                    [btnIcon setSelected:YES];
                    [label setTextColor:[UIColor whiteColor]];
                    
                }
            }
        }
    }
}
@end

