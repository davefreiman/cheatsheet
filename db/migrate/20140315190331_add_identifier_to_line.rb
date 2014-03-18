class AddIdentifierToLine < ActiveRecord::Migration
  def change
    add_column :lines, :identifier, :string
  end
end
