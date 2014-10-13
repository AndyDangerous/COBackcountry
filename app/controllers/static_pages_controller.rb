class StaticPagesController < ApplicationController
  def index
    locations = SkiPlace.all
    gon.numberOfGeometries = locations.length
    gon.geometry_url = "ski_places"
  end

  def about
  end

  def contact
  end
end
