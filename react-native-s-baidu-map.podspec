require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|

  s.name         = "react-native-s-baidu-map"
  s.version      = package['version']
  s.summary      = "Baidu Map for React Native"
  s.description  = <<-DESC
  Baidu Map views and modules for React Native
                   DESC

  s.homepage     = "https://github.com/GitXwj/react-native-s-baidumap"

  s.license      = "MIT"
  s.author             = { "gaosen" => "0x5e@sina.cn" }
  s.platform     = :ios, "9.0"


  s.source       = { :git => "https://github.com/GitXwj/react-native-s-baidumap.git" }

  s.source_files  = "iosLib/RNSBaidumap/**/*.{h,m,swift}"
  s.swift_version = "4.2"
  # s.public_header_files = "**/*.h"

  s.dependency "React"
  s.dependency 'BaiduMapKit', '5.1.0'
  s.dependency 'BMKLocationKit', '1.8.0'
end
