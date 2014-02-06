//
//  DiYuCell2.m
//  IYLM
//
//  Created by JianYe on 13-1-11.
//  Copyright (c) 2013年 Jian-Ye. All rights reserved.
//

#import "Cell2.h"

@implementation Cell2
@synthesize titleLabel;
- (void)dealloc
{
    self.titleLabel = nil;
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
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
    
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 5.0f, 150.0f, 50.0f)];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:titleLabel];
    RELEASE(titleLabel);
    
//    arrowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(200.0f, 5.0f, 50.0f, 50.0f)];
//    [self addSubview:arrowImageView];
//    RELEASE(arrowImageView);
    
    
}

@end
