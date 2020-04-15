
Pod::Spec.new do |s|

  s.name         = "RNBaiduMap"
  s.version      = "1.3.2"
  s.summary      = "RNBaiduMap"
  s.description  = <<-DESC
  Baidu Map views and modules for React Native
                   DESC

  s.homepage     = "https://github.com/GitXwj/react-native-s-baidumap"
  s.license      = "MIT"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/GitXwj/react-native-s-baidumap.git" }

  s.source_files  = "iosLib/RNSBaidumap/**/*.{h,m,swift}"
  s.swift_version = "4.2"

  s.dependency "React"
  s.dependency 'BaiduMapKit', '5.1.0'
  s.dependency 'BMKLocationKit', '1.8.0'
end
