class League < ActiveRecord::Base
  validates :name, presence: true
  validates :sport, presence: true
  validates :weekday, presence: true, inclusion: 0..6
  validates :club_id, presence: true
  validates :keeper_id, presence: true
  validates :max_number_of_players, numericality: { only_integer: true, in: 1..100 }
  belongs_to :keeper
  belongs_to :club

  def weekday_word
    self.weekday.to_weekday.downcase
  end

  def city
    self.club.city
  end

end
