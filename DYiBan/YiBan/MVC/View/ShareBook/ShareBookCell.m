//
//  ShareBookCell.m
//  ShareBook
//
//  Created by tom zeng on 14-2-11.
//  Copyright (c) 2014年 Tomgg. All rights reserved.
//

#import "ShareBookCell.h"

@implementation ShareBookCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization codsee;
        [self creatCell];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)creatCell{

    UIImageView *imageBook = [[UIImageView alloc]initWithFrame:CGRectMake(5.0f, 5.0f, 50.0f, 80.0f)];
    [imageBook setBackgroundColor:[UIColor redColor]];
    [self addSubview:imageBook];
    [imageBook release];
    
    UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, 5, 200, 20)];
    [labelName setText:@"三生三室枕上书"];
    [self addSubview:labelName];
    [labelName release];
    
    UILabel *labelAuther = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, CGRectGetMinY(labelName.frame) + CGRectGetHeight(labelName.frame) + 0, 200, 20)];
    [labelAuther setText:[ NSString stringWithFormat:@"作者：曾新"]];
    [labelAuther setFont:[UIFont systemFontOfSize:15]];
    [self addSubview:labelAuther];
    [labelAuther release];
    
    UILabel *labelPublic = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, CGRectGetMinY(labelAuther.frame) + CGRectGetHeight(labelAuther.frame) + 0, 200, 20)];
    [labelPublic setText:[NSString stringWithFormat:@"出版社：中国民族艺术出版社"]];
    [self addSubview:labelPublic];
    [labelPublic setFont:[UIFont systemFontOfSize:14]];
    [labelPublic release];
    
    UILabel *labelAddr = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, CGRectGetMinY(labelPublic.frame) + CGRectGetHeight(labelPublic.frame) + 3, 200, 20)];
    [labelAddr setText:@"长宁区娄山管路2董"];
    [self addSubview:labelAddr];
    [labelAddr setFont:[UIFont systemFontOfSize:12]];
    [labelAddr sizeToFit];
    [labelAddr release];
    
    UILabel *labelModel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(labelAddr.frame) + CGRectGetMinX(labelAddr.frame) + 5, CGRectGetMinY(labelPublic.frame) + CGRectGetHeight(labelPublic.frame) + 3, 200, 20)];
    [labelModel setText:@"做客模式"];
    [self addSubview:labelModel];
    [labelModel setFont:[UIFont systemFontOfSize:12]];
    [labelModel sizeToFit];
    [labelModel release];

    UILabel *labelMon = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(labelModel.frame) + CGRectGetMinX(labelModel.frame) + 30, CGRectGetMinY(labelPublic.frame) + CGRectGetHeight(labelPublic.frame) + 3, 200, 20)];
    [labelMon setText:@"50豆押金"];
    [self addSubview:labelMon];
    [labelMon setFont:[UIFont systemFontOfSize:12]];
    [labelMon sizeToFit];
    [labelMon release];

}
@end
