# BaiduNaviKit

百度地图导航包 iOS SDK(官方)

## 目录结构

```
.
├── BaiduNaviKit                                      # 导航和地图产物存放的目录
│   ├── MapSDK                                        # 地图产物目录
│   │   ├── BaiduMapAPI_Base.framework                # 地图base包
│   │   │   ├── BaiduMapAPI_Base
│   │   │   └── Headers
│   │   ├── BaiduMapAPI_Map.framework                 # 地图map包
│   │   │   ├── BaiduMapAPI_Map
│   │   │   ├── Headers
│   │   │   └── mapapi.bundle
│   │   ├── BaiduMapAPI_Search.framework              # 地图search包
│   │   │   ├── BaiduMapAPI_Search
│   │   │   └── Headers
│   │   ├── BaiduMapAPI_Utils.framework               # 地图utils包
│   │   │   ├── BaiduMapAPI_Utils
│   │   │   └── Headers
│   │   └── thirdlibs                                 # 地图依赖的三方库目录
│   │       ├── libcrypto.a
│   │       └──  libssl.a
│   └── NaviSDK                                       # 导航产物目录
│       ├── inc                                       # 导航public目录.h
│       ├── lib                                       # 导航相关静态库
│       │   ├── libBNTTSComponent_OpenSDK.a           # tts产物.a
│       │   └── libbaiduNaviOpenSDK.a                 # 导航产物.a
│       └── resource                                  # 导航资源文件
│           ├── baiduNaviSDK.bundle
│           ├── baiduTTSSDK.bundle
│           └── mode.bundle
├── BaiduNaviKit.podspec                              # pod描述文件
└── README.md 

```

**ps：若目录结构有变化，对应的 podspec 内的 subspec 相关描述也需要变更**

## 分库结构:

```
.
├── Base                         # 百度导航地图base包   默认
├── Map                          # 百度导航地图map包    默认
├── Navi                         # 百度导航地图navi包   默认
├── TTS                          # 百度导航地图tts包    可选
├── Search                       # 百度导航地图search包 可选
├── Cloud                        # 百度导航地图cloud包  可选 since 6.4.0下架
└── Utils                        # 百度导航地图utils包  可选
.

```

## 本地校验

- 在 BaiduNaviKit 目录下，终端执行：
  `pod lib lint --verbose`

## 提交 podspec

1. 压缩 `BaiduNaviKit.podspec`同级目录下的`BaiduNaviKit`并命名为`BaiduNaviKitV版本号.zip`, eg：`BaiduNaviKitV6.0.0.zip`,

2. 压缩后将压缩包上传至 BOS

3. 在 BaiduNaviKit 目录下，终端执行：
   `pod trunk push BaiduNaviKit.podspec`
   or
   `pod trunk push BaiduNaviKit.podspec --allow-warnings`

## 验证 github 上 spec 仓库是否存在

- 点击下面链接，查看是否存在对应的 spec 版本文件
  [see](https://github.com/CocoaPods/Specs/tree/master/Specs/b/9/1/BaiduNaviKit/);

## 删除 cocoapods 上指定版本

- 在 BaiduNaviKit 目录下，终端执行：
  `pod trunk delete BaiduNaviKit 版本号`
  eg：`pod trunk delete BaiduNaviKit 6.0.0`

## podfile编写

```
# 自6.0.0起导航地图支持分包集成
target 'YourProjectTarget' 
do #工程名字
   # BaiduNaviKit    pod版本号与基础地图版本号一致
   pod 'BaiduNaviKit', '6.0.0' # 默认集成Base Map Navi 组件
   # 可选组件
   # pod 'BaiduNaviKit/Map', '6.0.0'      # 集成地图Map包
   # pod 'BaiduNaviKit/Navi', '6.0.0'     # 集成Navi包
   # pod 'BaiduNaviKit/TTS', '6.0.0'      # 集成TTS包语音播报
   # pod 'BaiduNaviKit/Search', '6.0.0'   # 集成地图Search包
   # pod 'BaiduNaviKit/Cloud', '6.0.0'    # 集成地图Cloud包   since 6.4.0下架
   # pod 'BaiduNaviKit/Utils', '6.0.0'    # 集成地图Utils包
end     

```
