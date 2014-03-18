class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :player_id
      t.datetime :event_date
      t.integer :minutes
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

      t.timestamps
    end
  end
end
