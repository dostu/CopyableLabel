Pod::Spec.new do |s|
  s.name             = "CopyableLabel"
  s.version          = "1.0.0"
  s.summary          = "Copy after long press on UILabel"
  s.description      = <<-DESC
                        CopyableLabel allows to copy text of UILabel after long press.
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