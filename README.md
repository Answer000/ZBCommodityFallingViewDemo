
# ZBCommodityFallingTool

### 框架作用
 * 轻松实现商品掉落动画，使用简便。
 * https://github.com/AnswerXu/ZBCommodityFallingViewDemo.git
 
### 效果图
 ![image](https://github.com/AnswerXu/ZBCommodityFallingViewDemo/blob/master/ReadImage/fallingView.gif)
 
### 导入方法
 * 手动导入：将ZBCommodityFallingTool文件夹拖入工程中后引入头文件ZBCommodityFallingTools.h即可
 * pods导入：pod 'ZBCommodityFallingTools'
 
### 使用方法
```Objc 
    ZBCommodityFallingTools *tools =[ZBCommodityFallingTools shareTools];
    //设置属性
    tools.rotationNumber = 1;
    tools.viewType = roundViewType;
    tools.duration = 2.f;
    tools.endPoint = CGPointMake(KScreenSize.width/2, KScreenSize.height);
    tools.controlPoint = CGPointMake(KScreenSize.width/2, currentTouchP.y);
    //开始执行动画
    [tools startDropAnimationWithView:self.goodsImgView];
```
