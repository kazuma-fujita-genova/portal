# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'
use_frameworks!

def install_pods
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks

  # Pods for portal
  pod 'MaterialComponents','67.0.0'
  pod 'GoogleMaps','2.7.0'
  pod 'Alamofire','4.7.3'
  # pod 'FoldingCell','4.0.1'
  pod 'Hero','1.4.0'
  pod "FDFullscreenPopGesture",'1.1'
  pod 'SkeletonView','1.4.1'
  pod 'AMScrollingNavbar','5.1.1'
  pod 'PagingMenuController'
  pod 'FSPagerView'
  # pod 'ParallaxHeader', '~> 2.0.0'
  pod "MXParallaxHeader"

end

target 'portal' do
  install_pods
end

swift3_names = [
  'PagingMenuController',
]

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if swift3_names.include? target.name
                config.build_settings['SWIFT_VERSION'] = "3"
            else
                config.build_settings['SWIFT_VERSION'] = "4.2"
            end
        end
    end
end
