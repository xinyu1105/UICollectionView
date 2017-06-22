//
//  JXCollectionViewCell.h
//  UICollectionViewItemSelectDemo
//
//  Created by pengjiaxin on 2017/6/20.
//  Copyright © 2017年 pengjiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JXModel.h"
@interface JXCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *gameButton;
@property (nonatomic, strong) UIButton *statusButton;
-(void)configureCellWithModel:(JXModel *)model;
@end
