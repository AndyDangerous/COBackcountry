class SnotelStation < ActiveRecord::Base
  has_many :ski_places

  validates :name,
            :triplet,
            :wind,
            :elevation,
            :timezone, presence: true

  def daily
    Snotel.daily(token)
  end

  def token
    self.name.downcase.gsub(" ",'_').to_sym
  end
end
