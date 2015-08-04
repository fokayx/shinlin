class AddColumnEnglishnameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :en_name, :string
  end
end
