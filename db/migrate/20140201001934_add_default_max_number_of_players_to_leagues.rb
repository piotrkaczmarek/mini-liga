class AddDefaultMaxNumberOfPlayersToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :max_number_of_players, :integer, default: 50
  end
end
