require "sketchily/engine"
require "sketchily/sketchily"
require "sketchily/sketchily_tag"

module Sketchily
  ASSET_FILES = %w(sketchily.css sketchily.js sketchily_embed.js canvg/canvg.js canvg/rgbcolor.js extensions/ext-*.js locale/lang.*.js)

  SKETCHILY_OPTIONS = [:width, :height, :canvas_width, :canvas_height, :canvas_expansion, :hide_rulers, :hide_menu, :hide_image_tool, :hide_hyperlink_tool, :url]
  TAG_OPTIONS = [:id, :value, :index]
  OPTIONS = SKETCHILY_OPTIONS + TAG_OPTIONS

  ActiveSupport.on_load(:before_initialize) do
    Rails.configuration.assets.precompile += Sketchily::ASSET_FILES
  end
end

