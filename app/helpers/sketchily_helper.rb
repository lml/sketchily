module SketchilyHelper
  def sketchily_show(uri, options = {})
    "<img src='data:image/svg+xml;base64,#{uri}' #{"width='#{options[:width]}'" if options[:width]} #{"height='#{options[:height]}'" if options[:height]}/>".html_safe
  end

  def svg_show(uri, options = {})
    sketchily_show(uri, options)
  end
end

