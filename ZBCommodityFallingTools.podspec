Pod::Spec.new do |s|
    s.name         = 'ZBCommodityFallingTools'
    s.version      = '0.0.1'
    s.summary      = '实现商品掉落动画效果，一行代码轻松解决问题，可塑性高，使用简单方便。'
    s.homepage     = 'https://github.com/AnswerXu/ZBCommodityFallingViewDemo.git'
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author       = { "AnswerXu" => "zhengbo073017@163.com" }
    s.source       = { :git => 'https://github.com/AnswerXu/ZBCommodityFallingViewDemo.git', :tag => s.version.to_s }
    s.platform     = :ios, '7.0'
    s.source_files = 'ZBCommodityFallingViewDemo/ZBCommodityFallingTool/*.{h,m}',
    s.framework    = 'UIKit','CAAnimation'
    s.requires_arc = true

end
