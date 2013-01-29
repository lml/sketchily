# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sketchily/version'

Gem::Specification.new do |gem|
  gem.name          = "sketchily"
  gem.version       = Sketchily::VERSION
  gem.authors       = ["Dante Soares"]
  gem.email         = ["dms3@rice.edu"]
  gem.description   = %q{Easy svg-edit integration for any rails application}
  gem.summary       = %q{Sketchily allows you to easily add svg-edit support to your rails application. Svg-edit is treated just like any other form input tag.}
  gem.homepage      = "http://github.com/lml/sketchily"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rails", ">= 3.1"
end
