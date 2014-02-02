class Meeting < ActiveRecord::Base
  belongs_to :game_class

  def season
    self.game_class.season
  end
  
  def league
    self.season.league
  end

end
