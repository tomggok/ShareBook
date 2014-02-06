//
//  DYBBaseViewController.h
//  DYiBan
//
//  Created by NewM on 13-8-6.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "Dragon_ViewController.h"
#import "DYBNaviView.h"
#import "DYBBaseView.h"
#import "DYBUITabbarViewController.h"
#import "UIViewController+DragonCategory.h"

@interface DYBBaseViewController : DragonViewController
{
    DragonUITableView *_tbv;
    
    //无数据提示
    DragonUIImageView *_imgV_noDataTip;//
    DragonUILabel *_lb_noDataTip;//
}
AS_SIGNAL(BACKBUTTON);
AS_SIGNAL(NEXTSTEPBUTTON);
AS_SIGNAL(NoInternetConnection)//无网

@property (nonatomic, retain)DragonUIButton *leftButton;//左边的button
@property (nonatomic, retain)DragonUIButton *rightButton;//右边的button
@property (nonatomic, retain)DYBNaviView *headview;//headview
@property (nonatomic, assign, readonly)float headHeight;//获得vc的header的高度
@property (nonatomic, assign, readonly)CGFloat frameHeight;//获得vc的view的高度
@property (nonatomic, assign, readonly)CGFloat frameY;//获得vc的去处header和系统状态栏的Y轴
@property (nonatomic, retain)DYBBaseView *baseView;
@property (nonatomic, assign)DragonViewController *vc;
@property (nonatomic, retain) DragonUITableView *tbv;
@property (nonatomic, readonly, assign) float headViewHeight;//取得headview高度始终减去状态栏高度


//输入框 默认字符 颜色 所属类
- (void)setTextFeild:(DragonUITextField *)textFeild setPlaceholder:(NSString *)placeholder setColor:(UIColor *)color setControl:(UIViewController *)control;
//按钮 名称 信号 颜色 所属类
- (void)setDragonUIButton:(DragonUIButton *)btn setImageNorm:(UIImage *)ImageNorm setImageHigh:(UIImage *)ImageHigh signal:(NSString *)signal setControl:(UIViewController *)control;

- (void)backImgType:(int)type;
- (void) animateTextField:(UIView *)view up:(BOOL)yesOn getContrl:(UIViewController *)control;
- (void)setButtonImage:(DragonUIButton *)button setImage:(NSString *)string;
- (void)setButtonImage:(DragonUIButton *)button setImage:(NSString *)string  setHighString:(NSString *)hight;
- (NSData *)zipImg:(UIImage *)image;
@end
