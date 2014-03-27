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


  Player.all.each do |player|
    player.points = 0
    player.field_goals_made = 0
    player.field_goals_attempted = 0
    player.free_throws_made = 0
    player.free_throws_attempted = 0
    player.three_pointers_made = 0
    player.rebounds = 0
    player.assists = 0
    player.blocks = 0
    player.steals = 0
    player.turnovers = 0
    player.lines.each do |line|
      player.points += line.points
      player.field_goals_made += line.field_goals_made
      player.field_goals_attempted += line.field_goals_attempted
      player.free_throws_made += line.free_throws_made
      player.free_throws_attempted += line.free_throws_attempted
      player.three_pointers_made += line.three_pointers_made
      player.rebounds += line.rebounds
      player.assists += line.assists
      player.blocks += line.blocks
      player.steals += line.steals
      player.turnovers += line.turnovers
    end
    player.save
    puts player.display_name + " save"
  end  

end


