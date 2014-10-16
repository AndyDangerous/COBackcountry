class User < ActiveRecord::Base
  has_many :ski_places

  validates :name, :email, presence: true
end
