class CreateTotallines < ActiveRecord::Migration
  def change
    create_table :totallines do |t|
      t.string :season
      t.integer :points
      t.integer :field_goal_percentage      
      t.integer :free_throw_percentage
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
