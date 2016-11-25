
# ZBCommodityFallingTool

### 框架作用
 * 轻松实现商品掉落动画，使用简便。
 * https://github.com/AnswerXu/ZBCommodityFallingViewDemo.git
 
### 效果图
 ![image](https://github.com/AnswerXu/ZBCommodityFallingViewDemo/blob/master/ReadImage/fallingView.gif)
 
### 导入方法
 * 手动导入：将ZBCommodityFallingTool文件夹拖入工程中后引入头文件ZBCommodityFallingTools.h即可
 * pods导入：
 ```
 pod 'ZBCommodityFallingTools', '~> 0.0.2'
 ```
 
### 使用方法
 * 注意：参与掉落动画的dropView必须设置tag值为8088
 * 如多次调用该单例对象,请重新设置其属性，否则会自动保存上次调用时设置的属性
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

### 

	   谢谢支持，可能还有很多不完善的地方，期待您的建议！如对您有帮助，请不吝Star，您的支持与鼓励是我继续前行的动力。
	   邮箱：zhengbo073017@163.com
