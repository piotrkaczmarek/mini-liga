class ChangeLeagueWeekdayTypeToString < ActiveRecord::Migration
  def change
    change_column :leagues, :weekday, :string
  end
end
