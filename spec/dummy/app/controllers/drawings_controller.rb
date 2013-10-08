class DrawingsController < ApplicationController
  before_filter :get_drawing

  def show
  end

  def sketchily
  end

  def sketchily_tag
  end

  protected

  def get_drawing
    @drawing = Drawing.find(params[:id])
  end
end
