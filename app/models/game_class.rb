class GameClass < ActiveRecord::Base
  belongs_to :season
  belongs_to :league
  has_many :meetings
end
