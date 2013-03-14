module Sketchily
  module FormBuilderInstanceMethods
    def sketchily(method, options = {})
      @template.render(
        :partial => "sketchily/sketchily",
        :locals => {
          :template => @template,
          :object_name => @object_name,
          :method => method,
          :options => objectify_options(options)
        }
      )
    end

    alias_method :svg_edit, :sketchily
  end

  module ActionViewBaseInstanceMethods
    def sketchily(object_name, method, options = {})
      self.render(
        :partial => "sketchily/sketchily",
        :locals => {
          :template => self,
          :object_name => object_name,
          :method => method,
          :options => options
        }
      )
    end

    alias_method :svg_edit, :sketchily
  end
end

ActionView::Helpers::FormBuilder.send :include, Sketchily::FormBuilderInstanceMethods
ActionView::Base.send :include, Sketchily::ActionViewBaseInstanceMethods

