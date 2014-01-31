class AddPrizeAndDescriptionToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :prize, :string
    add_column :leagues, :description, :string
  end
end
