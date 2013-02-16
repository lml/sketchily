require "sketchily/engine"
require "sketchily/sketchily"
require "sketchily/sketchily_tag"

module Sketchily
  ASSET_FILES = %w(sketchily.css sketchily.js sketchily_embed.js canvg/canvg.js canvg/rgbcolor.js extensions/ext-*.js locale/lang.*.js)

  OPTIONS = [:width, :height, :canvas_width, :canvas_height, :canvas_expansion, :hide_rulers, :hide_menu, :hide_image_tool, :hide_hyperlink_tool]

  ROOT = File.expand_path('../..', __FILE__)

  VIEW = ActionView::Base.new
  VIEW.view_paths << "#{ROOT}/app/views"

  ActiveSupport.on_load(:before_initialize) do
    Rails.configuration.assets.precompile += Sketchily::ASSET_FILES
  end

  def self.render(options = {}, local_assigns = {}, &block)
    VIEW.render(options, local_assigns, &block)
  end
end

