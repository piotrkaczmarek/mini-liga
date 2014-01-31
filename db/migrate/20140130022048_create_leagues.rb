class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :weekday
      t.string :sport
      t.integer :max_number_of_players
      t.integer :club_id
      t.integer :rules_id
      t.integer :keeper_id
      t.timestamps
    end
  end
end
