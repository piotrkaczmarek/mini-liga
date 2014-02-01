class LeaguesController < ApplicationController

  def index
    @leagues = League.paginate(page: params[:page])
  end

  def show
    @league  = League.find(params[:id])
  end

  def edit
    @league = League.find(params[:id])
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
         :name,
         :prize,:description,
         :keeper_id, :club_id)
    end

end
