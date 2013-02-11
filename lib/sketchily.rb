module Sketchily
  ROOT = File.expand_path('../..', __FILE__)

  VIEW = ActionView::Base.new
  VIEW.view_paths << "#{ROOT}/app/views"

  def self.render(options = {}, local_assigns = {}, &block)
    template = if options[:locals] && options[:locals][:template]
                 options[:locals][:template]
               else
                 VIEW
               end
    template.render(options, local_assigns, &block)
  end
end

require "sketchily/engine"
require "sketchily/sketchily"
require "sketchily/sketchily_tag"

