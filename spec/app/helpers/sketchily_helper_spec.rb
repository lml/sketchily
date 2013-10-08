require 'test_helper'

describe SketchilyHelper do
  it 'must show svg image' do
    uri = 'test'
    sketchily_show(uri).must_equal "<img src='data:image/svg+xml;base64,#{uri}'  />"
  end
end
