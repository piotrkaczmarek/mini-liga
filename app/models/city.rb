class City < ActiveRecord::Base
  validates :name, presence: true
  has_many :clubs
  has_many :leagues, through: :club

end
