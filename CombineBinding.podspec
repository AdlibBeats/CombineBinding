#
# Be sure to run `pod lib lint CombineBinding.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CombineBinding'
  s.version          = '0.3.0'
  s.summary          = 'A short description of CombineBinding.'
  s.homepage         = 'https://github.com/AdlibBeats/CombineBinding'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AdlibBeats' => 'adlibbeats@icloud.com' }
  s.source           = { :git => 'https://github.com/AdlibBeats/CombineBinding.git' }
  s.ios.deployment_target = '13.0'
  s.source_files = 'CombineBinding/Classes/**/*'
end
