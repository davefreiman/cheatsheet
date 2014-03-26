desc "Total player stats"
task :add_stats => :environment do

  @stat_fields = ["points",
    "field_goals_made",
    "field_goals_attempted",
    "free_throws_made",
    "free_throws_attempted",
    "three_pointers_made",
    "rebounds",
    "assists",
    "blocks",
    "steals",
    "turnovers"]

end


