class SnotelStation < ActiveRecord::Base
  has_many :ski_places

  validates :name,
            :triplet,
            :wind,
            :elevation,
            :timezone, presence: true

  def daily
    daily = Snotel.daily(token)
    daily.empty? ? [{:snow_water_equivalent_in=>"no data",
                    :change_in_snow_water_equivalent_in=>"no data",
                    :snow_depth_in=>"no data"}] : daily
  end

  def token
    self.name.downcase.gsub(" ",'_').to_sym
  end
end
