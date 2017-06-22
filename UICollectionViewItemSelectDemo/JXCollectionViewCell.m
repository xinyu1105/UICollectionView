//
//  JXCollectionViewCell.m
//  UICollectionViewItemSelectDemo
//
//  Created by pengjiaxin on 2017/6/20.
//  Copyright © 2017年 pengjiaxin. All rights reserved.
//

#import "JXCollectionViewCell.h"

@implementation JXCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.gameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _gameButton.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    _gameButton.userInteractionEnabled = NO;
    [self.contentView addSubview:_gameButton];
    
    self.statusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _statusButton.userInteractionEnabled = NO;
    _statusButton.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    [_statusButton setImage:[UIImage imageNamed:@"activity_selected"] forState:UIControlStateNormal];
    [_statusButton setImage:[UIImage imageNamed:@"activity_unselected"] forState:UIControlStateSelected];
//    [_statusButton addTarget:self action:@selector(statusButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_statusButton];
}

-(void)configureCellWithModel:(JXModel *)model{
    [self.gameButton setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
    if (model.status == YES) {
        self.statusButton.selected = YES;
    }else{
        self.statusButton.selected = NO;
    }

}
@end
