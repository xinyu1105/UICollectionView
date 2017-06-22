//
//  JXCollectionView.h
//  UICollectionViewItemSelectDemo
//
//  Created by pengjiaxin on 2017/6/20.
//  Copyright © 2017年 pengjiaxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXCollectionView : UICollectionView
//选中
@property (nonatomic, strong) NSMutableArray *selectedArray;
//未选中
@property (nonatomic, strong) NSMutableArray *unselectedArray;
@end
