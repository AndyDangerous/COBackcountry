class AvalancheForecastZonesController < ApplicationController
  respond_to :json

  def index
    @zonez = AvalancheForecastZone.all
    respond_with @zonez
  end

  def show
    @zone = AvalancheForecastZone.find(params[:id])
    respond_with @zone
  end
end
