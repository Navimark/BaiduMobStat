Pod::Spec.new do |s|

s.name         = "BaiduMobStat_iOS_SDK"
s.version      = "3.4"
s.summary      = "百度信息流广告SDK,官方标记的版本号：(iOS 3.4)"

s.description  = <<-DESC
				百度信息流广告SDK,官方标记的版本号：(iOS 3.4)
				DESC

s.license      =  { :type => 'Copyright', :text => 'LICENSE  ©2013 Baidu, Inc. All rights reserved.' }
s.author       = { "chen" => "boch2436@gmail.com" }

s.homepage     = "http://mtj.baidu.com/"
s.platform     = :ios, "5.0"
s.source       = { :git => "git@github.com:iOSNerd/BaiduMobStat_iOS_SDK.git", :tag => "3.4" }

s.source_files = "ios_api/Release-iphoneos/*.h"
s.public_header_files = "ios_api/Release-iphoneos/*.h"
s.preserve_paths = "ios_api/Release-iphoneos/libBaiduMobStat.a"
s.vendored_libraries = "ios_api/Release-iphoneos/libBaiduMobStat.a"

s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => "$(SRCROOT)/PODS/BaiduMobStat_iOS_SDK/" }

s.frameworks   = 'Security', 'CoreLocation', 'CoreTelephony', 'SystemConfiguration' ,'UIKit', 'CoreGraphics','libstdc++.dylib','libz.dylib','Foundation'

end