//
//  ZBCommodityFallingCollectionViewCell.m
//  ZBCommodityFallingViewDemo
//
//  Created by 澳蜗科技 on 2016/11/25.
//  Copyright © 2016年 AnswerXu. All rights reserved.
//

#import "ZBCommodityFallingCollectionViewCell.h"
#import "ZBCommodityFallingTools.h"

@interface ZBCommodityFallingCollectionViewCell()
@property (nonatomic,strong) UIImageView *dropImgView;
@property (nonatomic,strong) UILabel *textLab;
@property (nonatomic,strong) UIButton *dropBtn;
@end

#define KScreenSize   [UIScreen mainScreen].bounds.size

@implementation ZBCommodityFallingCollectionViewCell
#pragma mark-  懒加载
-(UIImageView *)dropImgView{
    if (!_dropImgView) {
        _dropImgView = [[UIImageView alloc] init];
        _dropImgView.tag = 8088;
    }
    return _dropImgView;
}
-(UILabel *)textLab{
    if (!_textLab) {
        _textLab = [[UILabel alloc] init];
        _textLab.numberOfLines = 2;
        _textLab.font = [UIFont systemFontOfSize:14];
    }
    return _textLab;
}

-(UIButton *)dropBtn{
    if (!_dropBtn) {
        _dropBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _dropBtn;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    [self.contentView addSubview:self.dropImgView];
    [self.contentView addSubview:self.textLab];
    [self.contentView addSubview:self.dropBtn];
}

-(void)layoutSubviews{
    self.dropImgView.frame = CGRectMake(5, 5, self.bounds.size.width-10, self.bounds.size.width-10);
    self.textLab.frame = CGRectMake(5, CGRectGetMaxY(self.dropImgView.frame)+10, self.bounds.size.width-10, 40);
    self.textLab.text = @"淖尔问你老师我饿哦哈市发贺卡佛奥四点半就怄气微票儿豹女郎发哈的爱上了发哦司机欧派";
    self.dropBtn.frame = CGRectMake(self.bounds.size.width - 70, CGRectGetMaxY(self.textLab.frame)+10, 50, 30);
    [self.dropBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self.dropBtn addTarget:self action:@selector(dropClick:event:) forControlEvents:UIControlEventTouchUpInside];
    [self.dropBtn setTitle:@"drop" forState:UIControlStateNormal];

}

-(void)setDropImage:(UIImage *)dropImage{
    _dropImage = dropImage;
    self.dropImgView.image = dropImage;
}

-(void)dropClick:(UIButton *)sender event:(UIEvent *)event{
    ZBCommodityFallingTools *tools =[ZBCommodityFallingTools shareTools];
    //设置属性
    tools.rotationNumber = 0;
    tools.viewType = ovalViewType;
    tools.duration = 1.f;
    tools.endPoint = CGPointMake(KScreenSize.width/2, KScreenSize.height);
    tools.controlPoint = [self.dropImgView.superview convertPoint:self.dropImgView.center toView:[UIApplication sharedApplication].keyWindow];
    //开始执行动画
    [tools startDropAnimationWithView:self.dropImgView];
    
}


@end
