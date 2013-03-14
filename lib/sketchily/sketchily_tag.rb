module SketchilyTag
  module ActionViewBaseInstanceMethods
    def sketchily_tag(name, value = nil, options = {})
      self.render(
        :partial => "sketchily/sketchily_tag",
        :locals => {
          :name => name,
          :id => sanitize_to_id(name),
          :value => value,
          :options => options
        }
      )
    end

    alias_method :svg_edit_tag, :sketchily_tag
  end
end

ActionView::Base.send :include, SketchilyTag::ActionViewBaseInstanceMethods

