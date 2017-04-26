#
# This is a podspec for Iris RTC SDK
# Verified using `pod lib lint IrisRtcSdk.podspec`.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IrisRtcSdk'
  s.version          = '3.0.0.12'
  s.summary          = 'iOS SDK which leverages Comcast Iris Platform'

# This description is used to generate tags and improve search results.
#   * This SDK allows to use leverage Iris platform to make and
#   * receive audio or video calls. It uses webrtc and also uses
#   * Iris platform functionalities such as messaging, notifications
#   * Authentication, history etc.

  s.description      = <<-DESC
iOS SDK which leverages Comcast Iris Platform.
                       DESC

  s.homepage         = 'https://iris.comcast.com'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = { 'Comcast' => 'support@iris.comcast.com' }
  s.source           = { :git => 'https://github.com/Comcast/webrtc-ios-sdk.git', :branch => 'pod' }

  s.ios.deployment_target = '8.0'

  s.source_files = 'IrisRtcSdk/*', 'IrisRtcSdk/IrisRtcSdk/*.{h,m}', 'IrisRtcSdk/IrisRtcSdk/public/*.{h,m}', 'IrisRtcSdk/legacy/*.{h,m,mm}', 'IrisRtcSdk/XMPP/*.{h,m}', 'IrisRtcSdk/XMPP/XMPPFramework/**/*.{h,m}', 'IrisRtcSdk/socket.IO-objc/*','IrisRtcSdk/socket.IO-objc/**/*.{h,m,c}','IrisRtcSdk/webrtc/header/WebRTC/*', 'IrisRtcSdk/loggerSdk/header/*'
  s.public_header_files = 'IrisRtcSdk/IrisRtcSdk/public/*.h', 'IrisRtcSdk/webrtc/header'
  s.exclude_files = 'IrisRtcSdk/IrisRtcSdk/public/IrisRtcSdkCoreData.h'
  s.frameworks =  'AudioToolbox', 'Foundation', 'AVFoundation','CFNetwork', 'AssetsLibrary', 'VideoToolBox', 'AudioToolBox','GLKit','Security','SystemConfiguration','CoreAudio','VideoToolBox','CoreMedia','CoreFoundation'
  s.library = 'icucore', 'c++', 'xml2', 'idn', 'resolv'
  s.default_subspec = "precompiled"
  s.subspec 'precompiled' do |lib|
    #lib.public_header_files = 'IrisRtcSdk/webrtc/header'
    #lib.header_mappings_dir = 'IrisRtcSdk/webrtc/header'
    #lib.source_files = 'IrisRtcSdk/webrtc/header/WebRTC/*', 'IrisRtcSdk/loggerSdk/header/*'
    #lib.preserve_paths = 'webrtc/libs/libwebrtc.a'
    lib.vendored_libraries = 'IrisRtcSdk/webrtc/libs/libwebrtc.a' ,  'IrisRtcSdk/loggerSdk/libs/libwebrtc-logger-sdk.a', 'IrisRtcSdk/XMPP/XMPPFramework/Vendor/libidn/libidn.a'
    lib.libraries = 'webrtc', 'webrtc-logger-sdk'
    lib.xcconfig = { 'HEADER_SEARCH_PATHS' => "${PODS_ROOT}/#{s.name}/IrisRtcSdk/loggerSdk/header "  + "${PODS_ROOT}/#{s.name}/IrisRtcSdk/webrtc/header " + "$(SDKROOT)/usr/include/libxml2", 'LIBRARY_SEARCH_PATHS' => "${PODS_ROOT}/#{s.name}/IrisRtcSdk/loggerSdk/libs "  + "${PODS_ROOT}/#{s.name}/IrisRtcSdk/webrtc/libs " + "${PODS_ROOT}/#{s.name}/IrisRtcSdk/XMPP/XMPPFramework/Vendor/libidn/", 'FRAMEWORK_SEARCH_PATHS' => "$(PLATFORM_DIR)/Developer/Library/Frameworks", 'OTHER_LDFLAGS' => "-ObjC"}
  end
  # s.dependency 'AFNetworking', '~> 2.3'
end
