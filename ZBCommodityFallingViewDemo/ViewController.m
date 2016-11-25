//
//  ViewController.m
//  ZBCommodityFallingViewDemo
//
//  Created by 澳蜗科技 on 2016/11/24.
//  Copyright © 2016年 AnswerXu. All rights reserved.
//

#import "ViewController.h"
#import "ZBCommodityFallingTableView.h"
#import "ZBCommodityFallingCollectionView.h"
#import "ZBCommodityFallingCollectionViewLayout.h"

@interface ViewController ()
@property (nonatomic,strong) ZBCommodityFallingTableView *tableView;
@property (nonatomic,strong) ZBCommodityFallingCollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray<NSString *> *dataSource;
@end

@implementation ViewController
    
-(NSMutableArray<NSString *> *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        for (int i=0; i<20; i++) {
            [_dataSource addObject:[NSString stringWithFormat:@"%d.jpg",i%11]];
        }
    }
    return _dataSource;
}
    
-(ZBCommodityFallingTableView *)tableView{
    if (!_tableView) {
        CGRect rect = self.view.bounds;
        rect.size.height = self.view.bounds.size.height - 49;
        _tableView = [[ZBCommodityFallingTableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.images = self.dataSource;
    }
    return _tableView;
}

-(ZBCommodityFallingCollectionView *)collectionView{
    if (!_collectionView) {
        CGRect rect = self.view.bounds;
        rect.size.height = self.view.bounds.size.height - 49;
        _collectionView = [[ZBCommodityFallingCollectionView alloc] initWithFrame:rect collectionViewLayout:[[ZBCommodityFallingCollectionViewLayout alloc] init]];
        _collectionView.images = self.dataSource;
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    switch (self.tabBarController.selectedIndex) {
        case 0:
            [self.view addSubview:self.tableView];
            break;
        case 1:
            [self.view addSubview:self.collectionView];
            break;
        default:
            break;
    }
}

@end
