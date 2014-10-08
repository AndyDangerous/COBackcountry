class AvalancheForecastZonesController < ApplicationController
  respond_to :json

  def index
    @zonez = AvalancheForecastZone.all
    respond_with @zonez
  end
end
