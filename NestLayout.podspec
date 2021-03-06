Pod::Spec.new do |s|
  s.name             = 'NestLayout'
  s.version          = '0.4.0'
  s.summary          = 'Syntactic sugar for StackViews layout'

  s.description      = <<-DESC
This framework makes exclusive use of StackViews for configuring the layout: basically you can see it as syntactic sugar for StackView based layouts. the benefits are:

* The layout logic is implemented by Apple and the StackViews, not a third party developer. This means you can rely on it in terms of performance and implementation bugs.
* The API exposed by this framework will not change as long as the API used by StackViews does not change. This means you can rely on it in terms of long-term maintainability.
* The API exposed by this framework keeps your code tidy, easier to read and more expressive. In the end, less prone to bugs.
                       DESC

  s.homepage         = 'https://github.com/acecilia/NestLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Andrés Cecilia Luque' => 'a.cecilia.luque@gmail.com' }
  s.source           = { :git => 'https://github.com/acecilia/NestLayout.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/**/*'
  s.frameworks = 'UIKit'
end
