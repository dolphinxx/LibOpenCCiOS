#
# Be sure to run `pod lib lint LibOpenCCiOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LibOpenCCiOS'
  s.version          = '0.0.1'
  s.summary          = 'OpenCC iOS binary for flutter_opencc_ffi.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Build OpenCC iOS fat binary for flutter_opencc_ffi.
                       DESC

  s.homepage         = 'https://github.com/dolphinxx/LibOpenCCiOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache License 2.0', :file => 'LICENSE' }
  s.author           = { 'dolphinxx' => 'bravedolphinxx@gmail.com' }
  s.source           = { :http => 'https://github.com/dolphinxx/LibOpenCCiOS/releases/download/0.0.1/LibOpenCCiOS.tar.gz' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform = :ios
  s.ios.deployment_target = '9.0'

  s.xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.requires_arc = true
  s.vendored_frameworks = 'LibOpenCCiOS.xcframework'

  #s.libraries = 'c++'

  # s.resource_bundles = {
  #   'LibOpenCCiOS' => ['LibOpenCCiOS/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
