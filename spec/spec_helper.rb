# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"
require 'capybara/rails'
require 'pry'

Rails.backtrace_cleaner.remove_silencers!
