class LeaguesController < ApplicationController

  def index
    @leagues = League.paginate(page: params[:page])
  end

  def show
    @league  = League.find(params[:id])
  end

end
