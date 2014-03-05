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

    UIImage *imageIcon = [UIImage imageNamed:@"defualt_book"];
    UIImageView *imageBook = [[UIImageView alloc]initWithFrame:CGRectMake(5.0f, 5.0f, imageIcon.size.width/2, imageIcon.size.height/2)];
    [imageBook setBackgroundColor:[UIColor clearColor]];
    [imageBook setImage:[UIImage imageNamed:@"defualt_book"]];
    [self addSubview:imageBook];
    [imageBook release];
    
    UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, 5, 200, 20)];
    [labelName setText:@"三生三室枕上书"];
    [self addSubview:labelName];
    [labelName release];
    
    UILabel *labelAuther = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, CGRectGetMinY(labelName.frame) + CGRectGetHeight(labelName.frame) + 0, 200, 20)];
    [labelAuther setText:[ NSString stringWithFormat:@"作者：曾新"]];
    [labelAuther setTextColor:[UIColor colorWithRed:82.0f/255 green:82.0f/255 blue:82.0f/255 alpha:1.0f]];

    [labelAuther setFont:[UIFont systemFontOfSize:15]];
    [self addSubview:labelAuther];
    [labelAuther release];
    
    UILabel *labelPublic = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, CGRectGetMinY(labelAuther.frame) + CGRectGetHeight(labelAuther.frame) + 0, 200, 20)];
    [labelPublic setTextColor:[UIColor colorWithRed:82.0f/255 green:82.0f/255 blue:82.0f/255 alpha:1.0f]];
    [labelPublic setText:[NSString stringWithFormat:@"出版社：中国民族艺术出版社"]];
    [self addSubview:labelPublic];
    [labelPublic setFont:[UIFont systemFontOfSize:14]];
    [labelPublic release];
    
    UILabel *labelAddr = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(imageBook.frame) + CGRectGetMinX(imageBook.frame) + 5, CGRectGetMinY(labelPublic.frame) + CGRectGetHeight(labelPublic.frame) + 3, 200, 20)];
    [labelAddr setText:@"长宁区娄山管路2董"];
    [self addSubview:labelAddr];
    [labelAddr setTextColor:[UIColor colorWithRed:82.0f/255 green:82.0f/255 blue:82.0f/255 alpha:1.0f]];

    [labelAddr setFont:[UIFont systemFontOfSize:12]];
    [labelAddr sizeToFit];
    [labelAddr release];
    
    UILabel *labelModel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(labelAddr.frame) + CGRectGetMinX(labelAddr.frame) + 5, CGRectGetMinY(labelPublic.frame) + CGRectGetHeight(labelPublic.frame) + 3, 200, 20)];
    [labelModel setText:@"做客模式"];
    [labelModel setTextColor:[UIColor colorWithRed:82.0f/255 green:82.0f/255 blue:82.0f/255 alpha:1.0f]];

    [self addSubview:labelModel];
    [labelModel setFont:[UIFont systemFontOfSize:12]];
    [labelModel sizeToFit];
    [labelModel release];
//6.5 * 100 =
    
    UIImage *imageTitle = [UIImage imageNamed:@"title_bg"];
    UIImageView *imageViewLabel = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(labelModel.frame) + CGRectGetMinX(labelModel.frame) + 30, CGRectGetMinY(labelPublic.frame) + CGRectGetHeight(labelPublic.frame) + 3, imageTitle.size.width/2, imageTitle.size.height/2)];
    [imageViewLabel setImage:[UIImage imageNamed:@"title_bg"]];
    [self addSubview:imageViewLabel];
    RELEASE(imageViewLabel);
    
    
    UILabel *labelMon = [[UILabel alloc]initWithFrame:CGRectMake(2, 2, 200, 20)];
    [labelMon setText:@"50豆押金"];
    [imageViewLabel addSubview:labelMon];
    [labelMon setTextColor:[UIColor whiteColor]];
    [labelMon setBackgroundColor:[UIColor clearColor]];
    [labelMon setFont:[UIFont systemFontOfSize:12]];
    [labelMon sizeToFit];
    [labelMon release];
    
    
    UIImage *imageTitle1 = [UIImage imageNamed:@"title_bg"];
    UIImageView *imageViewLabel1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(labelModel.frame) + CGRectGetMinX(labelModel.frame) + 30, CGRectGetMinY(labelPublic.frame) + CGRectGetHeight(labelPublic.frame) + 3 - 40, imageTitle.size.width/2, imageTitle.size.height/2)];
    [imageViewLabel1 setImage:[UIImage imageNamed:@"title_bg"]];
    [self addSubview:imageViewLabel1];
    RELEASE(imageViewLabel1);
    
    
    UILabel *labelMon1 = [[UILabel alloc]initWithFrame:CGRectMake(2, 2, 200, 20)];
    [labelMon1 setText:@"5元租金"];
    [imageViewLabel1 addSubview:labelMon1];
    [labelMon1 setTextColor:[UIColor whiteColor]];
    [labelMon1 setBackgroundColor:[UIColor clearColor]];
    [labelMon1 setFont:[UIFont systemFontOfSize:12]];
    [labelMon1 sizeToFit];
    [labelMon1 release];

    [self setBackgroundColor:[UIColor colorWithRed:246.0f/255 green:246.0f/255 blue:246.0f/255 alpha:1.0f]];

    UIImageView *imageLine = [[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 90-1, 320.0f, 1)];
    [imageLine setImage:[UIImage imageNamed:@"line3"]];
    [self addSubview:imageLine];
    [imageLine release];
}
@end
