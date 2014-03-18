class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :salary
      t.integer :points
      t.integer :field_goals_made      
      t.integer :field_goals_attempted
      t.integer :free_throws_made
      t.integer :free_throws_attempted
      t.integer :three_pointers_made
      t.integer :rebounds
      t.integer :assists
      t.integer :blocks
      t.integer :steals
      t.integer :turnovers
      t.integer :team_id
      t.string :nba_team

      t.timestamps
    end
  end
end
