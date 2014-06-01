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

  def add_player    
    @player = Player.find(params[:player_id])
    @roster = Roster.find(params[:roster_id])
    @player.update_attributes(roster_id: @roster.id)

    redirect_to roster_path(@roster)
  end

  def remove_player
    @player = Player.find(params[:player_id])
    @roster = Roster.find(params[:roster_id])
    puts "\n"*5
    p params
    puts "\n"*5
    @player.update_attributes(roster_id: nil)
    redirect_to roster_path(@roster)
  end
end 