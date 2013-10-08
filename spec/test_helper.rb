ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

Rails.backtrace_cleaner.remove_silencers!

def setup_lib_spec
  @drawing = Drawing.create
  controller = DrawingsController.new
  controller.request = ActionController::TestRequest.new
  # Workaround for https://github.com/rails/rails/issues/11662
  controller.define_singleton_method(:params) do
    {}
  end
  @view = controller.view_context
end
