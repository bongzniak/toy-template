platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def ui_pods
    pod 'SnapKit'
end

def rx_pods
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'RxDataSources'
    pod 'RxOptional'
    pod 'RxViewController'
    pod 'RxKeyboard'
end

def pods
    # Logging
    pod 'CocoaLumberjack/Swift'

    # Architecture
    pod 'ReactorKit'
end

def networking_pods
    pod 'Alamofire'
    pod 'Moya'
    pod 'Moya/RxSwift'
    pod 'MoyaSugar'
    pod 'Kingfisher'
end

def misc_pods
    pod 'Then'
    pod 'ReusableKit'
    pod 'R.swift'
end

def firebase_pods
    pod 'Firebase/Core'
    pod 'Firebase/RemoteConfig'
    pod 'Firebase/Analytics'
    pod 'Firebase/Crashlytics'
    pod 'Firebase/Performance'
    pod 'Firebase/Messaging'
end

def social_pods
    pod 'KakaoSDKAuth'  # 사용자 인증
    pod 'KakaoSDKUser'  # 카카오 로그인, 사용자 관리
    pod 'KakaoSDKLink'  # 메시지(카카오링크)
    pod 'KakaoSDKTemplate'  # 메시지 템플릿
end

def tracking_pods
    pod 'Umbrella'
    pod 'Amplitude'
end

target 'appname' do
    pods
    networking_pods
    rx_pods
    ui_pods
    misc_pods
    firebase_pods
    social_pods
    tracking_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end

