class PlayersController < ApplicationController 

  def index
    @teams = Player.all.map { |p| p.nba_team}.uniq
    @players = Player.all
  end

end