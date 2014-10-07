class SnotelStationsController < ApplicationController
  respond_to :json

  def index
    @stations = SnotelStation.all
    respond_with @stations
  end
end
