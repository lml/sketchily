require 'spec_helper'

describe 'Viewing sketchily' do

  it 'should render the sketchily html through the form sketchily helper' do
    visit sketchily_path
    page.should have_selector('#svgedit_drawing_svg')
  end

  it 'should render the sketchily html through the sketchily_tag helper' do
    visit sketchily_tag_path
    page.should have_selector('#svgedit_drawing')
  end

end
