class SkiPlacesController < ApplicationController
  def new
    @ski_place = SkiPlace.new
  end

  def create
    @ski_place = SkiPlace.new(ski_place_params)
    # binding.pry
    if @ski_place.save
      # background_worker for geoprocessing
      flash[:notice] = "Your route has been added to the map. It should update momentarily."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @ski_place = SkiPlace.find(params[:id])
    factory = RGeo::GeoJSON::EntityFactory.instance
    gon.ski_place = RGeo::GeoJSON.encode(factory.feature(@ski_place.geometry, nil, {name: "#{@ski_place.name}", id: "#{@ski_place.id}"}))
  end

  private

  def ski_place_params

    safe_params = params.require(:ski_place).permit(:name, :description, :geometry)
    update_params(safe_params)
  end

  def update_params(columns)
    # factory = RGeo::GeoJSON::EntityFactory.instance
    thing = columns[:geometry].read
    feature = RGeo::GeoJSON.decode(thing, json_parser: :json)
    if feature.first.geometry
      columns[:geometry] = feature.first.geometry
    else
      columns[:geometry] = feature.geometry
    end

    # columns[:gpx_file] = RGeo::GeoJSON.encode(factory.featuregpx_file))
    # the_geom = ImportGeometry(columns[:geometry])
    # columns[:geometry] = the_geom
    # columns[:snotel_token] = CalculateSnotelToken(the_geom)
    # columns[:avalanche_forecast_zone] = FindAvalancheForecastZone(the_geom)
    # columns[:gpx_file]

    columns
  end
end

#
# data.each do |datum|
#   feature = RGeo::GeoJSON.decode(datum)
#   SkiPlace.create(geometry: feature.geometry, name: feature['name'])
# end
