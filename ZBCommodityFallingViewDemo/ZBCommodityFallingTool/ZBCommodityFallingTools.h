//
//  ZBCommodityFallingTools.h
//  ZBCommodityFallingViewDemo
//
//  Created by 澳蜗科技 on 2016/11/24.
//  Copyright © 2016年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ovalViewType = 0,
    roundViewType,
    originalViewType,
} FallingViewType;

@interface ZBCommodityFallingTools : NSObject
/**
 *掉落时旋转圈数,默认0圈
 */
@property (nonatomic,assign) NSUInteger rotationNumber;
/**
 *掉落位置
 */
@property (nonatomic,assign) CGPoint endPoint;
/**
 *掉落曲线控制点,默认为开始点
 */
@property (nonatomic,assign) CGPoint controlPoint;
/**
 *掉落动画时间,默认1s
 */
@property (nonatomic,assign) NSTimeInterval duration;
/**
 *掉落视图的圆角大小
 */
@property (nonatomic,assign) FallingViewType viewType;

/**
 *单例方法
 *注意：参与掉落动画的dropView必须设置tag值为8088
 *     如多次调用该单例对象,请重新设置其属性，否则会自动保存上次调用时设置的属性
 */
+(instancetype)shareTools;
/**
 *开始执行掉落动画
 */
- (void)startDropAnimationWithView:(UIView *)dropView;
    
@end
