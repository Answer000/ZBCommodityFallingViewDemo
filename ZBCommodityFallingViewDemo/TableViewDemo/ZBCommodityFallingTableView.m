//
//  ZBCommodityFallingTableView.m
//  ZBCommodityFallingViewDemo
//
//  Created by 澳蜗科技 on 2016/11/24.
//  Copyright © 2016年 AnswerXu. All rights reserved.
//

#import "ZBCommodityFallingTableView.h"
#import "ZBCommodityFallingTableViewCell.h"

@interface ZBCommodityFallingTableView()<UITableViewDataSource,UITableViewDelegate>

@end

#define KCellIdent  @"ZBCommodityFallingTableViewCell"

@implementation ZBCommodityFallingTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[ZBCommodityFallingTableViewCell class] forCellReuseIdentifier:KCellIdent];
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
    
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
    
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZBCommodityFallingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCellIdent forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:self.images[indexPath.row]];
    return cell;
}
    
@end
