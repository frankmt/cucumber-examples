require 'spec/factories'

class AddSubcategoriesTable < ActiveRecord::Migration
  def self.up
    create_table :subcategories do |t|
      t.references :category
      t.string :name
    end
    
    electronics = Category.find_by_name("Electronics")
    Factory :subcategory, :name => "Computers", :category => electronics
    Factory :subcategory, :name => "Laptops", :category => electronics
    Factory :subcategory, :name => "PDAs", :category => electronics
                          
    tvs = Category.find_by_name("TVs")
    Factory :subcategory, :name => "Flat Screen", :category => tvs
    Factory :subcategory, :name => "Plasma", :category => tvs
    Factory :subcategory, :name => "CRT", :category => tvs
    
  end

  def self.down
    drop_table :subcategories
    
    Subcategory.destroy_all
  end
end
