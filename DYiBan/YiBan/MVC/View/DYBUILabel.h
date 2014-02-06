//
//  DYBUILabel.h
//  DYiBan
//
//  Created by NewM on 13-9-12.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "Dragon_UILabel.h"

@interface DYBUILabel : DragonUILabel
@property (nonatomic, assign)NSInteger imgType;

- (void)setMaxLineNum:(NSInteger)maxLineNum maxFrame:(CGSize)maxFrame;
@end
