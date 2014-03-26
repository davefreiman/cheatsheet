desc "Fetch player stats"
task :fetch_stats => :environment do

  require "xmlstats"

  @admin = Superuser.where(name: "dfreiman").first
  Xmlstats.api_key = @admin.key
  Xmlstats.contact_info = @admin.email

  @n = 0
  @start_date = Date.parse("2013-10-28")

  while @start_date < Date.today
    @nightly_games = Xmlstats.events(@start_date, :nba)
    if @nightly_games != []
      puts "games on #{@start_date.inspect}"
      @nightly_games.each do |game|

        if game.event_status == "completed"
          puts game.event_id
          full_game_stats = [Xmlstats.nba_box_score(game.event_id).home_stats, Xmlstats.nba_box_score(game.event_id).away_stats] 
          full_game_stats.each do |box|
            if full_game_stats.index(box) == 0
              @opponent = Xmlstats.nba_box_score(game.event_id).away_team.first_name
            else
              @opponent = Xmlstats.nba_box_score(game.event_id).home_team.first_name              
            end 
            box.each do |line|        
              @player = Player.where("display_name" => line.display_name).first
              if @player && @player.display_name == line.display_name               
                puts "#{@player.display_name} had #{line.points} points - #{@player.first_name}_#{@player.last_name}_#{game.event_id}"
              else
                puts "this did not work: #{line.display_name}"
                @player = Player.new("display_name" => line.display_name, 
                "first_name" => line.first_name, 
                "last_name" => line.last_name, 
                "position" => line.position)
                @player.save
                puts "#{@player.display_name} saved!"
              end
              @line = Line.new("player_id" => @player.id,
                                "identifier" => "#{@player.first_name}_#{@player.last_name}_#{game.event_id}",
                                "points" => line.points,
                                "field_goals_made" => line.field_goals_made,
                                "field_goals_attempted" => line.field_goals_attempted,
                                "three_pointers_made" => line.three_point_field_goals_made,
                                "free_throws_made" => line.free_throws_made,
                                "free_throws_attempted" => line.free_throws_attempted,
                                "rebounds" => line.rebounds,
                                "assists" => line.assists,
                                "steals" => line.steals,
                                "blocks" => line.blocks,
                                "turnovers" => line.turnovers,
                                "minutes" => line.minutes,
                                "event_date" => @start_date,
                                "opponent" => @opponent
                                )
                @line.save
            end 
          end
          @n += 1
          puts "\n"*5
          puts "Sleeping..."
          puts "\n"*5
          sleep(1.minute)
          puts "AWAKE"
          puts "\n"*5
        end
      end     
    end
    @start_date = @start_date + 1.day
  end

  # line = Xmlstats.nba_box_score((Xmlstats.events(Date.parse("2014-02-23")).first.event_id)).home_stats.first 
  #   puts "#{line.display_name}: #{line.points} points, #{line.field_goals_made} fgm, #{line.field_goals_attempted}, #{line.free_throws_made}, #{line.free_throws_attempted}, #{line.rebounds}, #{line.assists}, #{line.blocks}, #{line.steals}"
  #   durant = Player.where("first_name" => line.first_name)
  #   puts durant.first.last_name

  # @nba_teams = Xmlstats.nba_teams

  # @nba_teams.each do |team|
  #   if @nba_teams.index(team) % 6 == 0 && @nba_teams.index(team) != 0
  #     puts "sleeping - goodnight"
  #     sleep(1.minute)
  #   end  
  #     @nba_roster = Xmlstats.nba_roster(team.team_id)
  #     @nba_roster.each do |player|
  #       @player = Player.new("display_name" => player.display_name, 
  #           "first_name" => player.first_name, 
  #           "last_name" => player.last_name, 
  #           "nba_team" => "#{team.first_name} #{team.last_name}",
  #           "position" => player.position)
  #       @player.save
  #       puts "#{@player.display_name} saved"
  #     end
  #     puts "#{team.full_name} - #{@nba_teams.index(team)} complete"
  # end


  # Player.where("nba_team" => nil).each do |player|
  #   @player = Player.new("display_name" => player.display_name, 
  #           "first_name" => player.first_name, 
  #           "last_name" => player.last_name, 
  #           "nba_team" => "#{player.team.first_name} #{player.team.last_name}",
  #           "position" => player.position)
  #   @player.save
  # end
  puts "Finished at #{Time.now}"

end


