require "minitest_helper"

# To be handled correctly by Capybara this spec must end with "Feature Test"
feature "Sketchily Feature Test" do
  scenario "should render the sketchily html" do
    visit sketchily_path
    page.must_have_selector("#svgedit_drawing_svg")
  end
end

