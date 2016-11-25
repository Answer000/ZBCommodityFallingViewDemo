//
//  ZBCommodityFallingCollectionViewLayout.m
//  ZBCommodityFallingViewDemo
//
//  Created by 澳蜗科技 on 2016/11/25.
//  Copyright © 2016年 AnswerXu. All rights reserved.
//

#import "ZBCommodityFallingCollectionViewLayout.h"

@implementation ZBCommodityFallingCollectionViewLayout

-(instancetype)init{
    if (self = [super init]) {
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - 3*5)/2;
        self.itemSize = CGSizeMake(width, width*1.5);
        self.minimumLineSpacing = 5;
        self.minimumInteritemSpacing = 5;
    }
    return self;
}

@end
