Pod::Spec.new do |s|
  s.name             = "TypedKey"
  s.version          = "0.1.0"
  s.summary          = "Statically-typed key for Swift. "
  s.homepage         = "https://github.com/devxoul/TypedKey"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Suyeol Jeon" => "devxoul@gmail.com" }
  s.source           = { :git => "https://github.com/devxoul/TypedKey.git",
                         :tag => s.version.to_s }
  s.source_files     = "Sources/*.swift"
  s.requires_arc     = true

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.0"
end
