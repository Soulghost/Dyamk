#
#  Be sure to run `pod spec lint DyamkClient.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "DyamkClient"
  s.version      = "0.0.1"
  s.summary      = "A short description of DyamkClient."
  s.description  = <<-DESC
                    a client for Dyamk Injector to inject native code into running apps.
                   DESC

  s.homepage     = "https://github.com/Soulghost/Dyamk"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "xiuyutong" => "xiuyutong1994@163.com" }
  s.social_media_url   = "https://twitter.com/Soulghost4"

  s.platform     = :ios
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/Soulghost/Dyamk", :tag => "#{s.version}" }
  s.source_files  = "Dyamk/**/*.{h,m}"
  s.public_header_files = "Dyamk/**/*.h"

  s.requires_arc = true
  s.dependency "CocoaAsyncSocket"

  #s.script_phase = { :name => '[Dyamk] Reset Framework Version', :script => 'rm /opt/Dyamk/dylib/framework_version || true' }
end
