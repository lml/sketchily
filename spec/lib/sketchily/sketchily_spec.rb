require 'test_helper'

module Sketchily
  describe Sketchily do
    before do
      setup_lib_spec
      @view.form_for(@drawing) do |f|
        @form_builder = f
      end
    end

    it 'must add methods to ActionView::Helpers::FormBuilder and ActionView::Base' do
      @form_builder.must_respond_to :sketchily
      @view.must_respond_to :sketchily
    end
    
    it 'must show sketchily' do
      sketchily = @form_builder.sketchily('svg')
      sketchily.wont_be_nil
      sketchily.wont_be_empty

      sketchily = @view.sketchily('drawing', 'svg')
      sketchily.wont_be_nil
      sketchily.wont_be_empty
    end
  end
end
