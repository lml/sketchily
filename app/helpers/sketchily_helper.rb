module SketchilyHelper
  def sketchily_show(uri, options = {})
    if options[:bkgd_color] || options[:bkgd_file]
      require 'nokogiri'
      doc = Nokogiri::XML(Base64.decode64(uri)) {|xml| xml.noblanks}

      if options[:bkgd_file]
        data_uri = "data:image/svg+xml;base64,#{Base64.strict_encode64(open(options[:bkgd_file]).read)}"
        bkgd_file_node = Nokogiri::XML::Node.new 'g', doc
        Nokogiri::XML::Builder.with(bkgd_file_node) do |xml|
          xml.title 'Background Image Layer'
          xml.image :id => 'background_image', :width => '100%', :height => '100%', :preserveAspectRatio => 'xMinYMin', 'xlink:href' => data_uri
        end
        doc.at('g').before(bkgd_file_node)
      end

      if options[:bkgd_color]
        bkgd_color_node = Nokogiri::XML::Node.new 'g', doc
        Nokogiri::XML::Builder.with(bkgd_color_node) do |xml|
          xml.title 'Background Color Layer'
          xml.rect :id => 'background_color', :width => '100%', :height => '100%', :fill => "##{options[:bkgd_color]}"
        end
        doc.at('g').before(bkgd_color_node)
      end

      uri = Base64.strict_encode64(doc.to_xml)
    end

    "<img src='data:image/svg+xml;base64,#{uri}' #{"width='#{options[:width]}'" if options[:width]} #{"height='#{options[:height]}'" if options[:height]}/>".html_safe
  end

  def svg_show(uri, options = {})
    sketchily_show(uri, options)
  end
end

