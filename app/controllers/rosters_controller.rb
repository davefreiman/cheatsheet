class RostersController < ApplicationController
  def show
    @roster = Roster.find(params[:id])
    #TODO: ROSTER BUILDER TOOL
    if params[:search]
      @players = Player.search(params[:search])
    end
  end

  def index
    @user = current_user
    if @user
      @rosters = @user.rosters.all
    else 
      redirect_to root_path
    end
  end
end 