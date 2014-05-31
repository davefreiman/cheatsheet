class RemoveTypeFromTotallines < ActiveRecord::Migration
  def change
    remove_column :totallines, :type, :string
    add_column :totallines, :line_type, :string
  end
end
