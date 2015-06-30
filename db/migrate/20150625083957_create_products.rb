class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name 
      t.string :texture
      t.string :diameter
      t.string :size
      t.string :surface

      t.timestamps null: false
    end
  end
end
