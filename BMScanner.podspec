Pod::Spec.new do |s|
s.name         = 'BMScanner'
s.version      = '2.0.0'
s.summary      = '一款对原始二维码扫描的封装，支持各种自定义'
s.homepage     = 'https://github.com/liangdahong/BMScan'
s.license      = 'MIT'
s.authors      = {'liangdahong' => 'ios@liangdahong.com'}
s.platform     = :ios, '7.0'
s.source       = {:git => 'https://github.com/liangdahong/BMScan.git', :tag => s.version}
s.source_files = 'BMScanner/**/*.{h,m}'
s.resources    = 'BMScanner/**/*.{png,bundle,xib,nib,db}'
s.requires_arc = true
end

