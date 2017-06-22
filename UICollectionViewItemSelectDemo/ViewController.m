//
//  ViewController.m
//  UICollectionViewItemSelectDemo
//
//  Created by pengjiaxin on 2017/6/20.
//  Copyright © 2017年 pengjiaxin. All rights reserved.
//

#import "ViewController.h"
#import "JXCollectionView.h"
#define itemW ((375-5*10)/4.0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addCollectionView];
    
}

-(void)addCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemW, itemW);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    JXCollectionView *collectionView = [[JXCollectionView alloc]initWithFrame:CGRectMake(0, 64, 375, 667-64) collectionViewLayout:layout];
    [self.view addSubview:collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
