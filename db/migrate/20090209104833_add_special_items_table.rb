class AddSpecialItemsTable < ActiveRecord::Migration
  def self.up
    create_table :special_items do |t|
      t.references :category
      t.references :subcategory
      
      t.string :name
      t.float :price
    end
  end

  def self.down
    drop_table :special_items
  end
end
