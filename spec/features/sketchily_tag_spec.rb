require "test_helper"

# To be handled correctly by Capybara this spec must end with "Feature Test"
feature "Sketchily Tag Feature Test" do
  scenario "should render the sketchily_tag html" do
    @drawing = Drawing.create
    visit sketchily_tag_drawing_path(@drawing)
    page.must_have_selector("#svgedit_drawing")
  end
end

