class CreateClub < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.integer :city_id
      t.string :name
    end
  end
end
