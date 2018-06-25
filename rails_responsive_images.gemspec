# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_responsive_images/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_responsive_images'
  spec.version       = RailsResponsiveImages::VERSION
  spec.authors       = ['Christoph Chilian', 'Josh Bradley']
  spec.email         = ['christoph@chilian.de', 'joshuabradley012@gmail.com']
  spec.summary       = %q{A Rails image_tag() extension to generate HTML5 <img> tags using srcset.}
  spec.description   = %q{Generate responsive images sizes on assets:precompile and include a handy img_tag helper.}
  spec.homepage      = 'https://joshbradley.me'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 11.2'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_runtime_dependency 'mini_magick', '~> 4.8'
  spec.add_runtime_dependency 'rails', '~> 5.2', '>= 5.2.0'
end
