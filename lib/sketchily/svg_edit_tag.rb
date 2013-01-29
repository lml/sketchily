module SvgEditTag
  module InstanceMethods
    def svg_edit_tag(name, value = nil, options = {})
      tag :input, { "type" => "hidden", "name" => name, "id" => sanitize_to_id(name), "value" => value }.update(options.stringify_keys)
    end
  end
end

ActionView::Helpers::FormTagHelper.send :include, SvgEditTag::InstanceMethods
