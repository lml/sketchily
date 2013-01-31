module Sketchily
  module InstanceMethods
    def sketchily(method, options = {})
      Sketchily.render(:partial => "sketchily/sketchily",
        :locals => {:template => @template, :object_name => @object_name,
                    :method => method, :options => objectify_options(options)}).html_safe
    end

    def svg_edit(method, options = {})
      sketchily(method, options)
    end
  end
end

ActionView::Helpers::FormBuilder.send :include, Sketchily::InstanceMethods
