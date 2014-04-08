class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_fields

  def load_fields 
    @stat_fields = {
      "points" => "PTS",
      "field_goals_made" => "FGM",
      "field_goals_attempted"=> "FGA",
      "free_throws_made"=> "FTM",
      "free_throws_attempted"=> "FTA",
      "three_pointers_made"=> "3PM",
      "rebounds"=> "REB",
      "assists"=> "AST",
      "blocks"=> "BLK",
      "steals"=> "STL",
      "turnovers"=> "TO"
    }
    @line_fields = {
      "ftime" => "DATE", 
      "opponent"=> "OPP", 
      "minutes"=> "MIN",
      "points" => "PTS",
      "field_goals_made"=> "FGM",
      "field_goals_attempted"=> "FGA",
      "free_throws_made"=> "FTM",
      "free_throws_attempted"=> "FTA",
      "three_pointers_made"=> "3PM",
      "rebounds"=> "REB",
      "assists"=> "AST",
      "blocks"=> "BLK",
      "steals"=> "STL",
      "turnovers"=> "TO"
    }
    @total_fields = {
      "points" => "PTS",
      "field_goal_percentage" => "FG%",
      "free_throw_percentage"=> "FT%",
      "three_pointers_made"=> "3PM",
      "rebounds"=> "REB",
      "assists"=> "AST",
      "blocks"=> "BLK",
      "steals"=> "STL",
      "turnovers"=> "TO"
    }
  end

  def load_totals(season)
    # TODO: Create Totalline Model and the necessary instance, fill with values, great thx.
    totals = {}
    values = Totalline.where("season" => season)
    @total_fields.each do |field, abbr|
      totals[abbr] = values.send(:field.to_sym)
    end
    totals
  end
end
