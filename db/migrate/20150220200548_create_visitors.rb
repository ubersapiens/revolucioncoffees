class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address

      t.timestamps null: false
    end
  end
end
