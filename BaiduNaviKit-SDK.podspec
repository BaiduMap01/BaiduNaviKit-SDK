#
#  Be sure to run `pod spec lint BaiduNaviKit-SDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = 'BaiduNaviKit-SDK'

  s.version      = '6.6.2.1'

  s.summary      = '百度导航iOS SDK（CocoaPods百度导航官方库,导航+基础地图包）'

  s.description  = <<-DESC
                   百度导航iOS SDK：百度导航官方CocoaPods.
                   百度iOS导航SDK是一套基于iOS 8及以上版本设备的应用程序接口。
                   您可以使用该套 SDK开发适用于iOS系统移动设备的导航应用，通过调用导航SDK接口，
                   您可以轻松访问百度导航的服务和数据，构建功能丰富、交互性强的导航类应用程序
                   百度iOS导航SDK提供的所有服务是免费的，接口使用无次数限制。
                   DESC

  s.homepage     = 'https://lbsyun.baidu.com/index.php?title=ios-navsdk'

  s.license      = { :type => 'Copyright', :text => 'Copyright (c) 2020 BaiduLBS' }

  s.author       = { "baidu navi sdk" => "v_wangdachuan@baidu.com" }

  # 导航sdk使用了cdn加速
  s.source       = { :http => "https://lbsyun-baidu.cdn.bcebos.com/iossdk/offline/navi/#{s.version}/BaiduNaviKit-SDKV#{s.version}.zip" }


  
  s.platform     = :ios, '10.0'
  # 声明ARC
  s.requires_arc = true 
  # 声明静态库
  s.static_framework = true 

  # 配置当前库的 bitcode
  s.pod_target_xcconfig  = { 'ENABLE_BITCODE' => 'NO',
                             'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
                             'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  # 配置宿主工程警告，bitcode
  s.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-w',
                             'ENABLE_BITCODE' => 'NO',
                             'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' } 


  # 系统依赖库 
  s.frameworks = ['Accelerate', 'AdSupport', 'AssetsLibrary', 'UserNotifications', 'MediaPlayer', 'CoreLocation', 'CoreBluetooth', 'CoreTelephony', 'AVFAudio']
  s.libraries = ['sqlite3.0', 'c++', 'iconv', 'z']

   
  # 默认集成的分库
  s.default_subspecs = ['Base', 'Map', 'Navi']

  # base子库
  s.subspec 'Base' do |sp|
  sp.ios.vendored_frameworks = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Base.framework'
  sp.ios.vendored_libraries = 'BaiduNaviKit-SDK/MapSDK/thirdlibs/*.{a}'
  sp.ios.source_files = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Base.framework/Headers/*.{h}'
  sp.ios.public_header_files = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Base.framework/Headers/*.{h}'
  end

  # map子库
  s.subspec 'Map' do |sp|
  sp.ios.dependency 'BaiduNaviKit-SDK/Base'
  sp.ios.resources = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Map.framework/*.bundle'
  sp.ios.vendored_frameworks = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Map.framework'
  sp.ios.source_files = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Map.framework/Headers/*.{h}'
  sp.ios.public_header_files = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Map.framework/Headers/*.{h}'
  end

  # navi子库
  s.subspec 'Navi' do |sp|
  sp.ios.dependency 'BaiduNaviKit-SDK/Map'
  sp.ios.source_files  = 'BaiduNaviKit-SDK/NaviSDK/inc/*.{h}'
  sp.ios.public_header_files = 'BaiduNaviKit-SDK/NaviSDK/inc/*.{h}'
  sp.ios.vendored_libraries = 'BaiduNaviKit-SDK/NaviSDK/lib/libbaiduNaviOpenSDK.a'
  sp.ios.resources = ['BaiduNaviKit-SDK/NaviSDK/resource/baiduNaviSDK.bundle', 'BaiduNaviKit-SDK/NaviSDK/resource/mode.bundle']
  end

 # tts子库
  s.subspec 'TTS' do |sp|
  sp.ios.dependency 'BaiduNaviKit-SDK/Navi'
  sp.ios.source_files  = 'BaiduNaviKit-SDK/NaviSDK/lib/inc/*.{h}'
  sp.ios.public_header_files = 'BaiduNaviKit-SDK/NaviSDK/lib/inc/*.{h}'
  sp.ios.vendored_libraries = 'BaiduNaviKit-SDK/NaviSDK/lib/libBNOpenTTSComponent.a'
  sp.ios.resources = ['BaiduNaviKit-SDK/NaviSDK/resource/baiduTTSSDK.bundle']
  end

  # search子库
  s.subspec 'Search' do |sp|
  sp.ios.dependency 'BaiduNaviKit-SDK/Base'
  sp.ios.vendored_frameworks = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Search.framework'
  sp.ios.source_files = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Search.framework/Headers/*.{h}'
  sp.ios.public_header_files = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Search.framework/Headers/*.{h}'
  end

  # utils子库
  s.subspec 'Utils' do |sp|
  sp.ios.dependency 'BaiduNaviKit-SDK/Base'
  sp.ios.vendored_frameworks = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Utils.framework'
  sp.ios.source_files = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Utils.framework/Headers/*.{h}'
  sp.ios.public_header_files = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Utils.framework/Headers/*.{h}'
  end
  
  # Bus子库
  s.subspec 'Bus' do |sp|
  sp.ios.dependency 'BaiduNaviKit-SDK/Base'
  sp.ios.vendored_frameworks = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Bus.framework'
  sp.ios.source_files = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Bus.framework/Headers/*.h'
  sp.ios.public_header_files = 'BaiduNaviKit-SDK/MapSDK/BaiduMapAPI_Bus.framework/Headers/*.h'
  end

end
