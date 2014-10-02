class SkiPlacesController < ApplicationController
  def index

  end

  def show
    @ski_place = SkiPlace.find(params[:id])
  end
end
