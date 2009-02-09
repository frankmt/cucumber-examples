class Category < ActiveRecord::Base
  has_many :subcategories
  
  validates_uniqueness_of :name
  
end