class Subcategory < ActiveRecord::Base
  belongs_to :category
  
  validates_uniqueness_of :name  
end