class SkiLinesController < ApplicationController
  def index

  end

  def show
    @ski_line = SkiLine.find(params[:id])
  end
end
