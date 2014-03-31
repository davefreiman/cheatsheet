class PlayersController < ApplicationController 

  def index
    @teams = Player.all.map { |p| p.nba_team}.uniq
    @players = Player.all
  end

  def show 
    @player = Player.find(params[:id])
    @stat_fields = {"points" => "PTS",
    "field_goals_made" => "FGM",
    "field_goals_attempted"=> "FGA",
    "free_throws_made"=> "FTM",
    "free_throws_attempted"=> "FTA",
    "three_pointers_made"=> "3PM",
    "rebounds"=> "REB",
    "assists"=> "AST",
    "blocks"=> "BLK",
    "steals"=> "STL",
    "turnovers"=> "TO"}
    @line_fields = {"ftime" => "DATE", "opponent"=> "OPP", "minutes"=> "MIN", "points" => "PTS",
    "field_goals_made"=> "FGM",
    "field_goals_attempted"=> "FGA",
    "free_throws_made"=> "FTM",
    "free_throws_attempted"=> "FTA",
    "three_pointers_made"=> "3PM",
    "rebounds"=> "REB",
    "assists"=> "AST",
    "blocks"=> "BLK",
    "steals"=> "STL",
    "turnovers"=> "TO"}
  end

end