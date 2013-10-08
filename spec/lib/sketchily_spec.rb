require 'test_helper'

module Sketchily
  describe Sketchily do
    it 'must precompile assets' do
      ASSET_FILES.each do |af|
        Rails.configuration.assets.precompile.must_include af
      end
    end
  end
end
