Pod::Spec.new do |s|
  s.name             = "CopyableLabel"
  s.version          = "4.2.0"
  s.summary          = "UILabel extension to enable copying"
  s.description      = <<-DESC
                        Copying can be enabled by setting copyable property of UILabel either in Interface Builder or
                        programatically.
                       DESC

  s.homepage         = "https://github.com/weby/CopyableLabel"
  s.screenshots      = "http://i.imgur.com/7kyuTS9.png"
  s.license          = 'MIT'
  s.author           = { "Donatas Stundys" => "donatas.stundys@gmail.com" }
  s.source           = { :git => "https://github.com/weby/CopyableLabel.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Source/*.swift'
end
