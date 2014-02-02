class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :date
      t.integer :game_class_id
      t.timestamps
    end
  end
end
