module Sketchily
  module FormBuilderInstanceMethods
    def sketchily(method, options = {})
      Sketchily.render(
        :partial => "sketchily/sketchily",
        :locals => {
          :template => @template,
          :object_name => @object_name,
          :method => method,
          :options => objectify_options(options)
        }
      ).html_safe
    end

    def svg_edit(method, options = {})
      sketchily(method, options)
    end
  end

  module ActionViewBaseInstanceMethods
    def sketchily(object_name, method, options = {})
      Sketchily.render(
        :partial => "sketchily/sketchily",
        :locals => {
          :template => self,
          :object_name => object_name,
          :method => method,
          :options => options
        }
      ).html_safe
    end

    def svg_edit(object_name, method, options = {})
      sketchily(object_name, method, options)
    end
  end
end

ActionView::Helpers::FormBuilder.send :include, Sketchily::FormBuilderInstanceMethods
ActionView::Base.send :include, Sketchily::ActionViewBaseInstanceMethods

