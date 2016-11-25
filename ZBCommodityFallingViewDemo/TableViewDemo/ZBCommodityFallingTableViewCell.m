//
//  ZBCommodityFallingTableViewCell.m
//  ZBCommodityFallingViewDemo
//
//  Created by 澳蜗科技 on 2016/11/24.
//  Copyright © 2016年 AnswerXu. All rights reserved.
//

#import "ZBCommodityFallingTableViewCell.h"
#import "ZBCommodityFallingTools.h"

@interface ZBCommodityFallingTableViewCell()
@property (nonatomic,strong) UIImageView *goodsImgView;
@property (nonatomic,strong) UILabel *textLab;
@property (nonatomic,strong) UIButton *dropBtn;
@end

#define KScreenSize  [UIScreen mainScreen].bounds.size

@implementation ZBCommodityFallingTableViewCell

#pragma mark-  懒加载
-(UIImageView *)goodsImgView{
    if (!_goodsImgView) {
        _goodsImgView = [[UIImageView alloc] init];
        _goodsImgView.tag = 8088;
    }
    return _goodsImgView;
}
-(UILabel *)textLab{
    if (!_textLab) {
        _textLab = [[UILabel alloc] init];
    }
    return _textLab;
}
-(UIButton *)dropBtn{
    if (!_dropBtn) {
        _dropBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _dropBtn;
}
    
    
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.goodsImgView];
        [self.contentView addSubview:self.textLab];
        [self.contentView addSubview:self.dropBtn];
    }
    return self;
}
    
-(void)layoutSubviews{
    self.goodsImgView.frame = CGRectMake(10, 10, self.bounds.size.height - 20, self.bounds.size.height - 20);
    self.goodsImgView.image = self.image;
    self.goodsImgView.backgroundColor = [UIColor cyanColor];
    self.textLab.frame = CGRectMake(CGRectGetMaxX(self.goodsImgView.frame) + 15, 0, self.bounds.size.width - (CGRectGetMaxX(self.goodsImgView.frame) + 15), self.bounds.size.height);
    self.textLab.text = @"请安抚我弱弱的千万人品";
    self.dropBtn.frame = CGRectMake(KScreenSize.width - 70, (self.bounds.size.height-30)/2, 50, 30);
    [self.dropBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self.dropBtn addTarget:self action:@selector(dropClick:event:) forControlEvents:UIControlEventTouchUpInside];
    [self.dropBtn setTitle:@"drop" forState:UIControlStateNormal];
}
    
-(void)dropClick:(UIButton *)sender event:(UIEvent *)event{
    NSSet *sets = [event allTouches];
    UITouch *touch = [sets anyObject];
    CGPoint currentTouchP = [touch locationInView:[UIApplication sharedApplication].keyWindow];
    
    ZBCommodityFallingTools *tools =[ZBCommodityFallingTools shareTools];
    //设置属性
    tools.rotationNumber = 1;
    tools.viewType = roundViewType;
    tools.duration = 2.f;
    tools.endPoint = CGPointMake(KScreenSize.width/2, KScreenSize.height);
    tools.controlPoint = CGPointMake(KScreenSize.width/2, currentTouchP.y);
    //开始执行动画
    [tools startDropAnimationWithView:self.goodsImgView];
    
}

@end
