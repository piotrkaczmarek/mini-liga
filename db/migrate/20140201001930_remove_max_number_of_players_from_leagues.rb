class RemoveMaxNumberOfPlayersFromLeagues < ActiveRecord::Migration
  def change
    remove_column :leagues, :max_number_of_players
  end
end
