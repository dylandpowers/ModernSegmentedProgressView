#
# Be sure to run `pod lib lint SegmentedProgressView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SegmentedProgressView'
  s.version          = '0.1.0'
  s.summary          = 'A progress view with discrete segments.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This progress view is geared toward situations where you need to display integer progress to a user. For example, how many punches do I have until I get a free sandwich? The Segmented Progress View displays the current progress and the goal progress. Additionally, developers can configure colors for both empty and full cells.
                       DESC

  s.homepage         = 'https://github.com/dylandpowers/SegmentedProgressView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dylanpowers25' => 'ddp19@duke.edu' }
  s.source           = { :git => 'https://github.com/dylandpowers/SegmentedProgressView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  
  s.platform = :ios, '10.0'

  s.source_files = 'SegmentedProgressView/Classes/**/*'
  

   s.frameworks = 'UIKit'
   s.dependency 'SnapKit', '~> 5.0'
end
