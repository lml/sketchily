require 'test_helper'

module Sketchily
  describe SketchilyTag do
    before do
      setup_lib_spec
    end

    it 'must add methods to ActionView::Base' do
      @view.must_respond_to :sketchily_tag
    end
    
    it 'must show sketchily tag' do
      sketchily_tag = @view.sketchily_tag('drawing', 'svg')
      sketchily_tag.wont_be_nil
      sketchily_tag.wont_be_empty
    end
  end
end
