//
//  JXCollectionView.m
//  UICollectionViewItemSelectDemo
//
//  Created by pengjiaxin on 2017/6/20.
//  Copyright © 2017年 pengjiaxin. All rights reserved.
//

#import "JXCollectionView.h"
#import "JXCollectionViewCell.h"
#import "JXCollectionReusableViewSectionHeader.h"
#import "JXModel.h"
@interface JXCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *titleArray;
@end

@implementation JXCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        //注册cell
        self.backgroundColor = [UIColor whiteColor];
        
        [self registerClass:[JXCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        //注册头
        [self registerClass:[JXCollectionReusableViewSectionHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"SelectedList" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        self.selectedArray = [NSMutableArray array];
        self.unselectedArray = [NSMutableArray array];
        for (NSDictionary *item in array) {
            JXModel *model = [[JXModel alloc]init];
            [model setValuesForKeysWithDictionary:item];
            if (model.status == YES) {
                [self.selectedArray addObject:model];
            }else{
                [self.unselectedArray addObject:model];
            }
            
        }
        
        self.titleArray = [NSMutableArray arrayWithObjects:@"已关注",@"未关注", nil];
        
    }
    return self;
}
#pragma mark - collectionView的数据源方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.selectedArray.count;
    }else{
        return self.unselectedArray.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JXCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        
        JXModel *model = self.selectedArray[indexPath.row];
        [cell configureCellWithModel:model];
        
    }else{
        JXModel *model = self.unselectedArray[indexPath.row];
        [cell configureCellWithModel:model];
    }
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        JXCollectionReusableViewSectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        header.titleLabel.text = self.titleArray[indexPath.section];
        return header;
    }
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(375, 20);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        JXModel *model = self.selectedArray[indexPath.row];
        model.status = !model.status;
        [self.selectedArray removeObject:model];
        [self.unselectedArray addObject:model];
        
        [self reloadData];
        
    }else{
        JXModel *model = self.unselectedArray[indexPath.row];
        model.status = !model.status;
        [self.unselectedArray removeObject:model];
        [self.selectedArray addObject:model];
        [self reloadData];
    }
}





@end
