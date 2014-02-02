class League < ActiveRecord::Base
  validates :name, presence: true
  validates :sport, presence: true
  validates :weekday, presence: true, inclusion: 0..6
  validates :club_id, presence: true
  validates :keeper_id, presence: true
  validates :max_number_of_players, numericality: { only_integer: true, in: 1..100 }
  belongs_to :keeper
  belongs_to :club
  has_many :seasons
  has_many :game_classes, through: :seasons
  has_many :meetings, through: :game_classes
  after_save :create_season_and_game_class_if_none

  def weekday_word
    self.weekday.to_weekday.downcase
  end

  def city
    self.club.city
  end

  protected
    def create_season_and_game_class_if_none
      self.seasons.create(name: "Season 1", year: Time.now.year) if self.seasons.empty?
      self.seasons.last.game_classes.create(name: "Game Class 1", active: true) if self.game_classes.empty?   
    end

end
