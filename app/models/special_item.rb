class SpecialItem < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  
  validates_presence_of :name
  validates_presence_of :category
  validates_presence_of :subcategory
  
  validate :subcategory_category_relationship
  
  
  def subcategory_category_relationship
    if category && subcategory
      errors.add(:subcategory, "has to belong to the specified category") if subcategory.category != category 
    end
  end
end