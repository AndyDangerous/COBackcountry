class SnotelStationsController < ApplicationController
  respond_to :json

  def index
    @stations = SnotelStation.all
    respond_with @stations
  end

  def show
    @station = SnotelStation.fine(params[:id])
    respond_with @station
  end
end
