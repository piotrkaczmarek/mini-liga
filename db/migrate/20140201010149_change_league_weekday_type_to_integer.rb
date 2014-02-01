class ChangeLeagueWeekdayTypeToInteger < ActiveRecord::Migration
  def change
    change_column :leagues, :weekday, :integer
  end
end
