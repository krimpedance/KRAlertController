Pod::Spec.new do |s|
  s.name         = "KRAlertController"
  s.version      = "1.0.0"
  s.summary      = "A beautiful alert controller for your iOS."
  s.description  = "KRAlertController is a beautiful and easy-to-use alert controller on iOS."
  s.homepage     = "https://github.com/krimpedance/KRAlertController"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author       = { "krimpedance" => "krimpedance@gmail.com" }
  s.requires_arc = true
  s.platform     = :ios, '8.2'
  s.ios.deployment_target = '8.2'
  
  s.source       = { :git => "https://github.com/krimpedance/KRAlertController.git", :tag => s.version.to_s }
  s.source_files = "KRAlertController/**/*.swift"
end
