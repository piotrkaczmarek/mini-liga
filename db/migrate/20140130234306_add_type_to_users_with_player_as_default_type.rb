class AddTypeToUsersWithPlayerAsDefaultType < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, default: "Player"
  end
end
