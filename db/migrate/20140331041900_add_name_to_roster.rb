class AddNameToRoster < ActiveRecord::Migration
  def change
    add_column :rosters, :name, :string
  end
end
