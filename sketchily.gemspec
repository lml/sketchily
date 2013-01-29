$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sketchily/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "Sketchily"
  s.version     = Sketchily::VERSION
  s.authors     = ["Dante Soares"]
  s.email       = ["dms3@rice.edu"]
  s.homepage    = "http://github.com/lml/sketchily"
  s.summary     = "Sketchily adds another form input tag to your application designed to allow the user to create or edit svg images through svg-edit."
  s.description = "Easy svg-edit integration for any rails application"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 3.1"

  s.add_development_dependency "sqlite3"
end
