class RostersController < ApplicationController
  def show
    @roster = Roster.find(params[:id])
    @players = @roster.players.all
    @mode = 'season'
    if params[:search]
      @search_players = Player.search(params[:search])
    end

    respond_to do |format|
      format.js {
       @mode = params[:mode] if params[:mode]     
      }
      format.html 
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
    @player.update_attributes(roster_id: nil)
    redirect_to roster_path(@roster)
  end
end 