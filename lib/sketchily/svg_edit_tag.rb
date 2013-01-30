module SvgEditTag
  module InstanceMethods
    def svg_edit_tag(name, value = nil, options = {})
      render :partial => "sketchily/svg_edit_tag", :locals => {:name => name, :value => value, :options => options}
    end
  end
end

ActionView::Helpers::FormTagHelper.send :include, SvgEditTag::InstanceMethods
