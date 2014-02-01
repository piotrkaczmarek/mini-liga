class Club < ActiveRecord::Base
  validates :name, presence: true
  validates :city_id, presence: true
  has_many :leagues
  belongs_to :city
end
