//
//  ZBCommodityFallingCollectionView.m
//  ZBCommodityFallingViewDemo
//
//  Created by 澳蜗科技 on 2016/11/25.
//  Copyright © 2016年 AnswerXu. All rights reserved.
//

#import "ZBCommodityFallingCollectionView.h"
#import "ZBCommodityFallingCollectionViewCell.h"

@interface ZBCommodityFallingCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

#define KItemIdent   @"ZBCommodityFallingCollectionViewCell"

@implementation ZBCommodityFallingCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[ZBCommodityFallingCollectionViewCell class] forCellWithReuseIdentifier:KItemIdent];
        self.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
    }
    return self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBCommodityFallingCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:KItemIdent forIndexPath:indexPath];
    item.dropImage = [UIImage imageNamed:self.images[indexPath.row]];
    return item;
}

@end
