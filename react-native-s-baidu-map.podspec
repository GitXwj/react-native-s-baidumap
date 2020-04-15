require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "react-native-s-baidumap"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/GitXwj/react-native-s-baidumap.git", :tag => "v#{s.version}" }
  s.source_files  = "iosLib/**/**/*.{h,m,swift}"

   s.dependency "React"
   s.dependency 'BaiduMapKit', '5.1.0'
   s.dependency 'BMKLocationKit', '1.8.0'
end
