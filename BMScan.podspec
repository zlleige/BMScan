Pod::Spec.new do |s|
s.name         = 'BMScan'
s.version      = '0.1.9'
s.summary      = '一款对原始二维码扫描的封装,自定义扫描 UI,使用协议配置'
s.homepage     = 'https://github.com/asiosldh/BMScan'
s.license      = 'MIT'
s.authors      = {'asiosldh' => 'asiosldh@163.com', 'liangdahong' => 'liangdahong@bluemoon.com.cn'}
s.platform     = :ios, '7.0'
s.source       = {:git => 'https://github.com/asiosldh/BMScan.git', :tag => s.version}
s.source_files = 'BMScan/**/*.{h,m}'
s.resources    = 'BMScan/**/*.{png,bundle,xib,nib,db}'
s.requires_arc = true
end

