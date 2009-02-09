class SpecialItem < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  
  validates_presence_of :name
  validates_presence_of :category
  validates_presence_of :subcategory
end