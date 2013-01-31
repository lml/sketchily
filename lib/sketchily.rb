module Sketchily
  ROOT = File.expand_path('../..', __FILE__)

  VIEW = ActionView::Base.new
  VIEW.view_paths << "#{ROOT}/app/views"

  def self.render(options = {}, local_assigns = {}, &block)
    VIEW.render(options, local_assigns, &block)
  end
end

require "sketchily/engine"
require "sketchily/sketchily"
require "sketchily/sketchily_tag"

