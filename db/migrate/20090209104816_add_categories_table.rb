require 'spec/factories'

class AddCategoriesTable < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
    end
    
    Factory :category, :name => "Electronics"
    Factory :category, :name => "TVs"
  end

  def self.down
    drop_table :categories
    
    Category.destroy_all
  end
end
