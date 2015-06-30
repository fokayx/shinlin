class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.belongs_to :product, index: true

      t.timestamps null: false
    end
  end
end
