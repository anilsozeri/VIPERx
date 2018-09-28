platform :ios, '9.0'

def shared_pods
  # Rx
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
  pod 'RxAlamofire', '~> 4.0'
end

def test_pods
  pod 'RxTest', '~> 4.0'
  pod 'RxBlocking', '~> 4.0'
end

target 'VIPER' do
  use_frameworks!

  # Pods for VIPER
  shared_pods

  post_install do |installer|
    installer.pods_project.targets.each do |target|
       if target.name == 'RxSwift'
          target.build_configurations.each do |config|
             if config.name == 'Debug'
                config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
             end
          end
       end
    end
 end

  target 'VIPERTests' do
    inherit! :search_paths
    # Pods for testing
    shared_pods
    test_pods
  end

  target 'VIPERUITests' do
    inherit! :search_paths
    # Pods for testing
    shared_pods
    test_pods
  end

end
