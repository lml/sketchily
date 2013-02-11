$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sketchily/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sketchily"
  s.version     = Sketchily::VERSION
  s.authors     = ["Dante Soares"]
  s.email       = ["dms3@rice.edu"]
  s.homepage    = "http://github.com/lml/sketchily"
  s.summary     = "Easy svg-edit integration for any rails application."
  s.description = "Sketchily adds another form input tag to your application designed to allow the user to create or edit svg images through svg-edit."

  s.files = Dir["{app,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 3.1"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'capybara', '2.0.2'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'pry'
end
