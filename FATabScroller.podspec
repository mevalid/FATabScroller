
Pod::Spec.new do |s|

  s.name         = "FATabScroller"
  s.version      = "1.0.1"
  s.summary      = "A basic tab container."

  s.description  = "The FATabScroller is a completely customizable widget with set of layered pages where only one page is displayed at a time." 

  s.homepage     = "https://github.com/mevalid/FATabScroller"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Mirela" => "mevalid224@gmail.com" }
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/mevalid/FATabScroller.git", :tag => s.version }
  s.source_files  = "FATabScroller", "FATabScroller/**/*.{h,m}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

  s.dependency "Font-Awesome-Swift", "~> 1.6.4"
  s.dependency "SCLayout", "~> 1.0.0"

end
