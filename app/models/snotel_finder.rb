class SnotelFinder

  def self.centroid(ski_place)
    binding.pry
    where{ST_AsText(ST_Centroid(ski_place.geometry))}
  end
end

# 
# SkiPlace.where{
#   geometry, st_centroid
# }.last
