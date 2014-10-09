class SkiPlacesController < ApplicationController


  def new
    @ski_place = SkiPlace.new
  end

  def create
    @ski_place = SkiPlace.new(ski_place_params)
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

  def ski_place_params

    safe_params = params.require(:ski_place).permit(:name, :description, :geometry)
    update_params(safe_params)
  end


  def update_params(columns)
    ski_geom = GpxParser.parse(columns[:geometry])
    feature = RGeo::GeoJSON.decode(ski_geom, json_parser: :json)

    if feature.respond_to?(:geometry)
      columns[:geometry] = feature.geometry
    else
      columns[:geometry] = feature.first.geometry
    end
    columns
  end
end
