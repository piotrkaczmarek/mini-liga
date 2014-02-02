class LeaguesController < ApplicationController

  def index
    @leagues = League.paginate(page: params[:page])
  end

  def show
    @league  = League.find(params[:id])
    @new_meetings = @league.meetings.where("date >= :now", {now: Time.now}).order(date: :desc)
    @old_meetings = @league.meetings.where("date <= :now", {now: Time.now}).order(date: :desc)
  end

  def edit
    @league = League.find(params[:id])
    @season = @league.seasons.last
    @meetings = @league.meetings.order(date: :desc)
    @new_meeting = @season.game_classes.first.meetings.new
  end

  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to leagues_path
    else
      render 'new'
    end

  end

  private
  
    def league_params
      params.require(:league).
        permit(:sport, :weekday,
         :max_number_of_players,
         :name,:prize,:description,
         :keeper_id, :club_id,
         :for_match_score_use_big_points,
         :for_match_score_use_small_points,
         :for_match_score_required_big_points_spread,
         :for_match_score_required_small_points_spread,
         :for_match_score_big_points_upper_limit,
         :for_match_score_small_points_upper_limit)
    end

end
