class MeetingsController < ApplicationController

  def create
    @meeting = Meeting.new(meetings_params)
    if @meeting.save
      redirect_to edit_league_path(@meeting.league)
    else
      redirect_to root_path
    end
  end

  protected
    def meetings_params
      params.require(:meeting).permit(:date, :game_class_id)
    end

end
