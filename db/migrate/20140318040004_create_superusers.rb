class CreateSuperusers < ActiveRecord::Migration
  def change
    create_table :superusers do |t|
      t.string :name
      t.string :key
      t.string :email

      t.timestamps
    end
  end
end
