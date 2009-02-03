class AddItemsTable < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :price
    end
  end

  def self.down
    drop_table :items
  end
end
