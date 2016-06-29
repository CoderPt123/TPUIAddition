
Pod::Spec.new do |s|
  s.name             = "TPUIAddition"
  s.version          = "0.1.0"
  s.summary          = "TPUIAddition."

  s.homepage         = "http://blog.csdn.net/dpttp"
  s.license          = 'MIT'
  s.author           = { "TPeng" => "tpengtt@sina.com" }
  s.source           = { :git => "https://git.oschina.net/TPSky/TPUIAddition.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.public_header_files = 'TPUIAddition/**/*.h'
  s.source_files = 'TPUIAddition/**/*'

  s.frameworks = 'UIKit', 'Foundation'

end
