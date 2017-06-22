//
//  JXCollectionReusableViewSectionHeader.m
//  UICollectionViewItemSelectDemo
//
//  Created by pengjiaxin on 2017/6/21.
//  Copyright © 2017年 pengjiaxin. All rights reserved.
//

#import "JXCollectionReusableViewSectionHeader.h"

@implementation JXCollectionReusableViewSectionHeader
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 375, 20)];
    _titleLabel.textColor = [UIColor blueColor];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_titleLabel];
}
@end
