class League < ActiveRecord::Base
  validates :name, presence: true
  validates :sport, presence: true
  validates :weekday, presence: true, inclusion: 0..6


  def weekday_word
    ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday" ][self.weekday]
  end

end
