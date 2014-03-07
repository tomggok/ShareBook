//
//  ShareBookApplyViewController.m
//  ShareBook
//
//  Created by tom zeng on 14-2-19.
//  Copyright (c) 2014年 Tomgg. All rights reserved.
//

#import "ShareBookApplyViewController.h"
#import "ShareBookDetailCell.h"
#import "ShareBookApplyCell.h"
#import "DYBInputView.h"
#import "CALayer+Custom.h"
#import "ShareBookMoreAddrViewController.h"
#import "NSDate+Helpers.h"

@interface ShareBookApplyViewController (){

    UILabel *labelTime1;
    DYBInputView *_phoneInputNameRSend;
    BOOL bKeyShow;
}

@end

@implementation ShareBookApplyViewController

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
        [self.headview setTitle:@"申请借阅"];
        
        
        //        [self.leftButton setHidden:YES];
        [self setButtonImage:self.leftButton setImage:@"icon_retreat"];
        //        [self setButtonImage:self.rightButton setImage:@"home"];
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        [self.headview setBackgroundColor:[UIColor colorWithRed:22.0f/255 green:29.0f/255 blue:36.0f/255 alpha:1.0f]];
        
    }
    else if ([signal is:[MagicViewController CREATE_VIEWS]]) {
        
        [self.rightButton setHidden:YES];
        bKeyShow = NO;
        [self.view setBackgroundColor:[MagicCommentMethod colorWithHex:@"f0f0f0"]];
        
        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
        }
        else{
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillShowNotification object:nil];
        };

        
        UIView *viewBG = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0, 320.0f, self.view.frame.size.height)];
        [viewBG setBackgroundColor:[MagicCommentMethod colorWithHex:@"f0f0f0"]];
        [self.view addSubview:viewBG];
        RELEASE(viewBG);
        
        
        UIImage *imageIcon = [UIImage imageNamed:@"defualt_book"];
        UIImageView *imageBook = [[UIImageView alloc]initWithFrame:CGRectMake(5.0f, 5.0f + self.headHeight, imageIcon.size.width/2, imageIcon.size.height/2)];
        [imageBook setBackgroundColor:[UIColor clearColor]];
        [imageBook setImage:[UIImage imageNamed:@"defualt_book"]];
        [viewBG addSubview:imageBook];
        [imageBook release];
        
        UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, 5.0f + self.headHeight, 200, 20)];
        [labelName setText:@"三生三室枕上书"];
        [viewBG addSubview:labelName];
        [labelName release];
        
        UILabel *labelAuther = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, CGRectGetMinY(labelName.frame) + CGRectGetHeight(labelName.frame) + 0, 200, 20)];
        [labelAuther setText:[ NSString stringWithFormat:@"作者：曾新"]];
        [labelAuther setTextColor:[UIColor colorWithRed:82.0f/255 green:82.0f/255 blue:82.0f/255 alpha:1.0f]];
        
        [labelAuther setFont:[UIFont systemFontOfSize:15]];
        [viewBG addSubview:labelAuther];
        [labelAuther release];
        
        UILabel *labelPublic = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, CGRectGetMinY(labelAuther.frame) + CGRectGetHeight(labelAuther.frame) + 0, 200, 20)];
        [labelPublic setTextColor:[UIColor colorWithRed:82.0f/255 green:82.0f/255 blue:82.0f/255 alpha:1.0f]];
        [labelPublic setText:[NSString stringWithFormat:@"出版社：中国民族艺术出版社"]];
        [viewBG addSubview:labelPublic];
        [labelPublic setFont:[UIFont systemFontOfSize:14]];
        [labelPublic release];
        
 
        UILabel *labelTime = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, CGRectGetMinY(labelPublic.frame) + CGRectGetHeight(labelPublic.frame) + 0, 200, 20)];
        [labelTime setTextColor:[UIColor colorWithRed:82.0f/255 green:82.0f/255 blue:82.0f/255 alpha:1.0f]];
        [labelTime setText:[NSString stringWithFormat:@"借阅时间："]];
        [viewBG addSubview:labelTime];
        [labelTime setFont:[UIFont systemFontOfSize:14]];
        [labelTime release];
        
        labelTime1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(labelTime.frame) + CGRectGetMinX(labelTime.frame) + 5-130, CGRectGetMinY(labelPublic.frame) + CGRectGetHeight(labelPublic.frame) + 0, 200, 20)];
        [labelTime1 setTextColor:[UIColor colorWithRed:82.0f/255 green:82.0f/255 blue:82.0f/255 alpha:1.0f]];
        [labelTime1 setText:[NSString stringWithFormat:@"2014-02-20 15：30"]];
        [viewBG addSubview:labelTime1];
        [labelTime1 setFont:[UIFont systemFontOfSize:14]];
        [labelTime1 release];
        
        UIButton *btnChooseTime = [[UIButton alloc]initWithFrame:CGRectMake(280.0f, CGRectGetMinY(labelPublic.frame) + CGRectGetHeight(labelPublic.frame) + 0, 20.0f, 20.0f)];
        [btnChooseTime setBackgroundColor:[UIColor clearColor]];
        [btnChooseTime setImage:[UIImage imageNamed:@"calendar"] forState:UIControlStateNormal];
        [btnChooseTime addTarget:self action:@selector(doChooseTime) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnChooseTime];
        RELEASE(btnChooseTime);
        
        
        
        DYBInputView *_phoneInputNameR = [[DYBInputView alloc]initWithFrame:CGRectMake( 5, CGRectGetMinY(btnChooseTime.frame) + CGRectGetHeight(btnChooseTime.frame) + 10, 250, 40) placeText:@"长宁区天山路145号" textType:0];
        [_phoneInputNameR.layer AddborderByIsMasksToBounds:YES cornerRadius:4 borderWidth:1 borderColor:[[UIColor blackColor] CGColor]];
        //        [_phoneInputNameR.nameField setText:@"1"];
        [_phoneInputNameR.nameField setTextColor:[UIColor blackColor]];
        [_phoneInputNameR setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:_phoneInputNameR];
        RELEASE(_phoneInputNameR);
        
        
        UIButton *btnMoreAddr = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(_phoneInputNameR.frame) + CGRectGetMinX(_phoneInputNameR.frame) + 20 , CGRectGetMinY(btnChooseTime.frame) + CGRectGetHeight(btnChooseTime.frame), 50, 40)];
        [btnMoreAddr addTarget:self action:@selector(doMoreAddr) forControlEvents:UIControlEventTouchUpInside];
        [btnMoreAddr setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:btnMoreAddr];
        RELEASE(btnMoreAddr);
        
        
        
        
        DYBUITableView * tbDataBank11 = [[DYBUITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMinY(_phoneInputNameR.frame) + CGRectGetHeight(_phoneInputNameR.frame) + 10, 320.0f, self.view.frame.size.height -CGRectGetMinY(_phoneInputNameR.frame) + CGRectGetHeight(_phoneInputNameR.frame) + 10  ) isNeedUpdate:YES];
        [tbDataBank11 setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:tbDataBank11];
        [tbDataBank11 setSeparatorColor:[UIColor colorWithRed:78.0f/255 green:78.0f/255 blue:78.0f/255 alpha:1.0f]];
        RELEASE(tbDataBank11);
        [tbDataBank11 setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [self creatDownBar];
        
        
    }else if ([signal is:[MagicViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[MagicViewController DID_DISAPPEAR]]){
        
        
    }
}

+(NSDate*) convertDateFromString:(NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}



-(void)doChooseTime{
    
    
    
    UIView *viewBG = [[UIView alloc]initWithFrame:CGRectMake(0.0F, 300.0f, 320.0f, 200.0f)];
    [viewBG setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:viewBG];
    RELEASE(viewBG);
    
    UIDatePicker *datePicker = [[ UIDatePicker alloc] initWithFrame:CGRectMake(0.0,300,0.0,0.0)];

    datePicker.datePickerMode  = UIDatePickerModeDateAndTime;
    datePicker.minuteInterval = 5;

    
    NSDate* minDate = [NSDate convertDateFromString:@"1900-01-01 00:00:00 -0500"];
    NSDate* maxDate = [NSDate convertDateFromString:@"2099-01-01 00:00:00 -0500"];
    
    datePicker.minimumDate = minDate;
    datePicker.maximumDate = maxDate;
    
    datePicker.date = [NSDate date];
//    [datePicker setDate:maxDate animated:YES];
    
    
    [self.view addSubview:datePicker];
    RELEASE(datePicker);
    
    
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    
    
    
}


-(void)dateChanged:(UIDatePicker *)sender{


    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate* _date = control.date;

}

-(void)doMoreAddr{

    ShareBookMoreAddrViewController *moreBook = [[ShareBookMoreAddrViewController alloc]init];
    [self.drNavigationController pushViewController:moreBook animated:YES];
    RELEASE(moreBook);


}

-(void)creatDownBar{

    
    int offset = 0;
    if (!IOS7_OR_LATER) {
        
        offset = 20;
    }
    
    UIImage *imageBG = [UIImage imageNamed:@"down_options_bg"];
    UIImageView *viewBG = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, self.view.frame.size.height - imageBG.size.height/2 - offset, 320.0f, imageBG.size.height/2)];
    [viewBG setUserInteractionEnabled:YES];
//    [viewBG setBackgroundColor:[UIColor redColor]];
    [viewBG setTag:201];
    [viewBG setImage:[UIImage imageNamed:@"down_options_bg"]];
    [self.view addSubview:viewBG];
    RELEASE(viewBG);
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(5.0f, 5.0f, 200.0f, 30.0f)];
    [viewBG addSubview:textField];
    RELEASE(textField);
    
    
    
    _phoneInputNameRSend = [[DYBInputView alloc]initWithFrame:CGRectMake(10.0f, 10.0f, 250.0f, 30.0f) placeText:@"输入内容" textType:0];
    [_phoneInputNameRSend.layer AddborderByIsMasksToBounds:YES cornerRadius:4 borderWidth:1 borderColor:[[UIColor blackColor] CGColor]];
    //        [_phoneInputNameR.nameField setText:@"1"];
    [_phoneInputNameRSend.nameField setTextColor:[UIColor blackColor]];
    [_phoneInputNameRSend setBackgroundColor:[UIColor clearColor]];
    [viewBG addSubview:_phoneInputNameRSend];
    RELEASE(_phoneInputNameRSend);
    
    UIImage *image = [UIImage imageNamed:@"send"];
    
    UIButton *btnSend = [[UIButton alloc]initWithFrame:CGRectMake(270, ( imageBG.size.height/2 - image.size.height/2)/2, image.size.width/2, image.size.height/2)];
    [btnSend setImage:[UIImage imageNamed:@"send"] forState:UIControlStateNormal];
    [btnSend addTarget:self action:@selector(doSend) forControlEvents:UIControlEventTouchUpInside];
    [btnSend setBackgroundColor:[UIColor redColor]];
    [viewBG addSubview:btnSend];
    RELEASE(btnSend);

}

-(void)doSend{

    [_phoneInputNameRSend.nameField resignFirstResponder];
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
        
        NSNumber *s = [NSNumber numberWithInteger:60];
        [signal setReturnValue:s];
        
        
    }else if([signal is:[MagicUITableView TABLETITLEFORHEADERINSECTION]])/*titleForHeaderInSection*/{
        
    }else if([signal is:[MagicUITableView TABLEVIEWFORHEADERINSECTION]])/*viewForHeaderInSection*/{
        
    }else if([signal is:[MagicUITableView TABLETHEIGHTFORHEADERINSECTION]])/*heightForHeaderInSection*/{
        
    }else if([signal is:[MagicUITableView TABLECELLFORROW]])/*cell*/{
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
        ShareBookApplyCell *cell = [[ShareBookApplyCell alloc]init];
        
        
        [cell creatCell:indexPath.row];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
//        UIImageView *imageLine = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 60-1, 320.0f, 1)];
//        [imageLine setImage:[UIImage imageNamed:@"line3"]];
//        [cell addSubview:imageLine];
//        [imageLine release];
        
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

- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    static CGFloat normalKeyboardHeight = 216.0f;
    
    NSDictionary *info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    CGFloat distanceToMove = kbSize.height - normalKeyboardHeight;
    
  
    UIView *viewBg = [self.view viewWithTag:201];
    CGRect rect = viewBg.frame;
    
    if (self.view.frame.size.height - rect.origin.y < 100) {
        
        rect.size.height = rect.size.height - kbSize.height  - 60 ;
        [viewBg setFrame:rect];
    }else{
        
        UIImage *imageBG = [UIImage imageNamed:@"down_options_bg"];
//        UIImageView *viewBG = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, self.view.frame.size.height - imageBG.size.height/2, 320.0f, imageBG.size.height/2)];
        [viewBg setFrame:CGRectMake(0.0f, self.view.frame.size.height - imageBG.size.height/2, 320.0f, imageBG.size.height/2)];
    
    }
    
    
    //自适应代码
}

-(void)handleViewSignal_MagicUITextField:(MagicViewSignal *)signal{
    if ([signal isKindOf:[MagicUITextField TEXTFIELDDIDBEGINEDITING]]) {
        
//        [scrollView setContentSize:CGSizeMake(320.0f, CGRectGetHeight(self.view.frame))];
        //        [viewBG setCenter:CGPointMake(160, self.view.frame.size.height/2 -30)];
        
    }else if ([signal isKindOf:[MagicUITextField TEXTFIELDDIDENDEDITING]]){
        
        //        [viewBG setCenter:CGPointMake(160, self.view.frame.size.height/2 +10 )];
        
    }else if ([signal isKindOf:[MagicUITextField TEXTFIELDSHOULDRETURN]]){
        
        //        [viewBG setCenter:CGPointMake(160, self.view.bounds.size.height/2 +10 )];
        MagicUITextField *filed = (MagicUITextField *)[signal source];
        [filed resignFirstResponder];
        
        UIView *viewBg = [self.view viewWithTag:201];
        CGRect rect = viewBg.frame;
        
        
            UIImage *imageBG = [UIImage imageNamed:@"down_options_bg"];
            //        UIImageView *viewBG = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, self.view.frame.size.height - imageBG.size.height/2, 320.0f, imageBG.size.height/2)];
            [viewBg setFrame:CGRectMake(0.0f, self.view.frame.size.height - imageBG.size.height/2, 320.0f, imageBG.size.height/2)];
      

        
    }
    
    
    
}

@end
