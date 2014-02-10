//
//  ShareMessagerCell.m
//  ShareBook
//
//  Created by apple on 14-2-10.
//  Copyright (c) 2014年 Tomgg. All rights reserved.
//

#import "ShareMessagerCell.h"

@implementation ShareMessagerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
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

    UIImageView *imageIcon = [[UIImageView alloc]initWithFrame:CGRectMake(5.0f, 5.0f, 40.0f, 40.0f)];
    [imageIcon setBackgroundColor:[UIColor redColor]];
    [self addSubview:imageIcon];
    [imageIcon release];
    
    UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageIcon.frame) + CGRectGetWidth(imageIcon.frame)+ 10, 5, 100.0f, 20.0f)];
    [labelName setText:@"tomgg"];
    [self addSubview:labelName];
    [labelName release];
    
    UILabel *labelMSG = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(imageIcon.frame) + CGRectGetWidth(imageIcon.frame)+ 10, 25, 200, 20)];
    [labelMSG setText:@"ddfgsfgsddfg"];
    [self addSubview:labelMSG];
    [labelMSG release];
    
    UILabel *labelTime = [[UILabel alloc]initWithFrame:CGRectMake(240, 5,80 , 20)];
    [labelTime setText:@"2014-02-09"];
    [labelTime setFont:[UIFont systemFontOfSize:14.0f]];
    [self addSubview:labelTime];
    [labelTime release];

}

@end
