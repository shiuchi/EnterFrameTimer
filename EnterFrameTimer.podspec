
Pod::Spec.new do |s|
  s.name         = "EnterFrameTimer"
  s.version      = "0.0.2"
  s.summary      = "EnterFrameTimer."
  s.description  =  "EnterFrameTimer for Swift"
  s.swift_version = '4.0'
  s.homepage     = "https://github.com/shiuchi/EnterFrameTimer"
  s.license      = "MIT"
  s.author             = { "shiuchi" => "s.shiuchi[at]gmail.com" }
  # s.platform     = :ios
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/shiuchi/EnterFrameTimer.git" , :tag => s.version.to_s}
  s.source_files  =  "EnterFrameTimer/EnterFrameTimer/Sources/**/*"
  s.requires_arc = true
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '(inherited)′,′LIBRARYSEARCHPATHS′=>′(inherited)', 'OTHER_LDFLAGS' => '$(inherited)' }
end