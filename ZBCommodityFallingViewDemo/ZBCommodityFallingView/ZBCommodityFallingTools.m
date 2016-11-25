//
//  ZBCommodityFallingTools.m
//  ZBCommodityFallingViewDemo
//
//  Created by 澳蜗科技 on 2016/11/24.
//  Copyright © 2016年 AnswerXu. All rights reserved.
//

#import "ZBCommodityFallingTools.h"

@interface ZBCommodityFallingTools()<CAAnimationDelegate>
    @property (nonatomic,strong) UIImageView *imgView;
@end

#define KeyWindow      [[UIApplication sharedApplication] keyWindow]
#define KScreenWidth   [UIScreen mainScreen].bounds.size.width
#define KScreenHeight  [UIScreen mainScreen].bounds.size.height

@implementation ZBCommodityFallingTools

static ZBCommodityFallingTools *_tools = nil;
+(instancetype)shareTools{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tools = [[[self class] alloc] init];
    });
    return _tools;
}

- (void)startDropAnimationWithView:(UIView *)dropView{
    CGPoint center = [dropView.superview convertPoint:dropView.center toView:KeyWindow];
    CGRect rect = [dropView.superview convertRect:dropView.frame toView:KeyWindow];
    switch (self.viewType) {
        case ovalViewType:
            self.imgView = [self setupOvalImageView:dropView];
            break;
        case roundViewType:
            self.imgView = [self setupRoundImageView:dropView];
            break;
        case originalViewType:
            self.imgView = [self setupOriginalImageView:dropView];
            break;
        default:
            break;
    }
    self.imgView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    [KeyWindow addSubview:self.imgView];
    [self.imgView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:self.duration != 0 ? self.duration : 1];
    [self setAnimationWith:center imageView:self.imgView];
}
    
#pragma mark   掉落动画
- (void)setAnimationWith:(CGPoint)startPoint imageView:(UIImageView *)imageView{
    //设置路径
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:CGPointMake(startPoint.x, startPoint.y)];
    [movePath addQuadCurveToPoint:self.endPoint controlPoint:CGPointEqualToPoint(self.controlPoint, CGPointZero) ? startPoint : self.controlPoint];
    //平移
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnimation.path = movePath.CGPath;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //缩放
    CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnimation.removedOnCompletion = NO;
    boundsAnimation.toValue   = [NSValue valueWithCGRect:CGRectZero];
    boundsAnimation.fromValue = [NSValue valueWithCGRect:self.imgView.bounds];
    //旋转
    CABasicAnimation *revolveAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //x,y,z:x轴，y轴，z轴
    revolveAnimation.toValue  = [NSNumber numberWithFloat:2 * M_PI * self.rotationNumber];
    revolveAnimation.removedOnCompletion = NO;
    revolveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//缓入缓出
    //创建动画组
    CAAnimationGroup *animatinGroup = [CAAnimationGroup animation];
    animatinGroup.autoreverses = NO;
    animatinGroup.removedOnCompletion = NO;
    [animatinGroup setValue:self.imgView.layer forKey:@"animatinGroup"];
    animatinGroup.fillMode = kCAFillModeForwards;
    animatinGroup.animations = @[moveAnimation,revolveAnimation,boundsAnimation];
    animatinGroup.duration = self.duration != 0 ? self.duration : 1;
    [self.imgView.layer addAnimation:animatinGroup forKey:nil];
}

- (UIImage *)drawOvalView:(UIView *)view{
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(view.bounds.size.width, view.bounds.size.height), NO, 0);
    //绘制外边框
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(1, 1, view.bounds.size.width-2, view.bounds.size.height-2)];
    [[UIColor redColor] set];
    [path stroke];
    
    //描述图片裁剪路径
    UIBezierPath *picPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(1, 1, view.bounds.size.width - 2, view.bounds.size.height - 2)];
    //裁剪
    [picPath addClip];
    //将View上的内容绘制到上下文中
    [view drawRect:view.bounds];
    //从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark-  OvalViewType
-(UIImageView *)setupOvalImageView:(UIView *)dropView{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [self drawOvalView:dropView];
    return imageView;
}
#pragma mark-  RoundViewType
-(UIImageView *)setupRoundImageView:(UIView *)dropView{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.layer.cornerRadius = 10;
    imageView.layer.masksToBounds = YES;
    imageView.layer.borderWidth = 1;
    imageView.layer.borderColor = [UIColor redColor].CGColor;
    imageView.image = [(UIImageView *)dropView image];
    return imageView;
}
#pragma mark -  originalViewType
-(UIImageView *)setupOriginalImageView:(UIView *)dropView{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [(UIImageView *)dropView image];
    return imageView;
}

@end
