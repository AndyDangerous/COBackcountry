class User < ActiveRecord::Base
  has_many :ski_places

  validates :name, :email, presence: true

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.email    = auth.info.email
      user.image    = auth.info.image
    end
  end
end
