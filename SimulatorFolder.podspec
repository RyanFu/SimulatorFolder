Pod::Spec.new do |s|
  s.name             = "SimulatorFolder"
  s.version          = "1.0.0"
  s.summary          = "When running your app on simulator, it will create a symbolic link to your app folder on your desktop"
 
  s.description      = "When running your app on simulator, it will create a symbolic link to your app folder on your desktop, when targeting on iOS device, it does nothing. You just add this pod and you don't need to write any code, it just works!"

  s.homepage         = "https://github.com/carmelosui/SimulatorFolder"
  s.license          = 'MIT'
  s.author           = { "Carmelo Sui" => "" }
  s.source           = { :git => "https://github.com/carmelosui/SimulatorFolder.git", :tag => "1.0.0" }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
