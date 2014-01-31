class KeepersController < ApplicationController

  def leagues
    @leagues = League.where(keeper_id: params[:id])
    redirect_to new_league_keeper_path if @leagues.empty? 
  end

  def new_league
    keeper = Keeper.find(params[:id])
    @league = League.new(keeper_id: keeper.id, club_id: keeper.club_id)
  end

end
