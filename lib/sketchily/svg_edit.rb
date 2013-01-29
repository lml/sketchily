module SvgEdit
  module InstanceMethods
    def svg_edit(object_name, method, options = {})
      InstanceTag.new(object_name, method, self, options.delete(:object)).to_input_field_tag("hidden", options)
    end
  end
end

ActionView::Helpers::FormHelper.send :include, SvgEdit::InstanceMethods
