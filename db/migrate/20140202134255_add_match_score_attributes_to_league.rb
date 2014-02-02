class AddMatchScoreAttributesToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :for_match_score_use_big_points, :boolean
    add_column :leagues, :for_match_score_use_small_points, :boolean
    add_column :leagues, :for_match_score_required_big_points_spread, :integer
    add_column :leagues, :for_match_score_required_small_points_spread, :integer
    add_column :leagues, :for_match_score_big_points_upper_limit, :integer
    add_column :leagues, :for_match_score_small_points_upper_limit, :integer
  end
end
