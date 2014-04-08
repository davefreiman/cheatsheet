class AddTypeToTotalline < ActiveRecord::Migration
  def change
    add_column :totallines, :type, :string
  end
end
