class AddOpponentToLine < ActiveRecord::Migration
  def change
    add_column :lines, :opponent, :string
  end
end
