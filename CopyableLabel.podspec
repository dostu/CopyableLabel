Pod::Spec.new do |s|
  s.name             = "CopyableLabel"
  s.version          = "2.0.1"
  s.summary          = "UILabel extension to enable copying"
  s.description      = <<-DESC
                        Copying can be enabled by setting copyable property of UILabel either in Interface Builder or
                        programatically.
                       DESC

  s.homepage         = "https://github.com/weby/CopyableLabel"
  s.screenshots      = "http://i.imgur.com/ukNVqWf.png"
  s.license          = 'MIT'
  s.author           = { "Donatas Stundys" => "donatas.stundys@gmail.com" }
  s.source           = { :git => "https://github.com/weby/CopyableLabel.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end