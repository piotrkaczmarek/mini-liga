class CreateGameClasses < ActiveRecord::Migration
  def change
    create_table :game_classes do |t|
      t.boolean :active
      t.integer :season_id
      t.string :name

      t.timestamps
    end
  end
end
