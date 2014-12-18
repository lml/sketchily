require "sketchily/engine"
require "sketchily/sketchily"
require "sketchily/sketchily_tag"

module Sketchily
  ASSET_FILES = %w(sketchily.css sketchily.js sketchily_embed.js svg-edit/canvg/canvg.js svg-edit/canvg/rgbcolor.js svg-edit/extensions/ext-*.js svg-edit/locale/lang.*.js)

  SKETCHILY_OPTIONS = [:width, :height, :bkgd_color, :bkgd_url, :canvas_width, :canvas_height, :canvas_expansion, :hide_rulers, :hide_menu, :hide_image_tool, :show_hyperlink_tool, :show_layers, :url, :extensions]
  TAG_OPTIONS = [:id, :value, :index]
  OPTIONS = SKETCHILY_OPTIONS + TAG_OPTIONS

  ActiveSupport.on_load(:before_initialize) do
    Rails.configuration.assets.precompile += ASSET_FILES
  end
end
