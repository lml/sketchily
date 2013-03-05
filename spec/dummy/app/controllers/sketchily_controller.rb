class SketchilyController < ApplicationController
  def sketchily
    @drawing = Drawing.new
  end

  def sketchily_tag
    @drawing = Drawing.new
  end
end
