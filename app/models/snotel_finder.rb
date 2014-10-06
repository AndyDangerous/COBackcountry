class SnotelFinder

  def self.find(ski_place)
    Snotel.daily(:berthoud_summit)
  end
end

#
# SkiPlace.where{
#   geometry, st_centroid
# }.last
