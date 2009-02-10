require File.dirname(__FILE__) + '/../spec_helper'

describe Category do
  
  it "should validate uniqueness of name" do
    category = Factory :category
    
    new_category = Category.new(:name => category.name)
    new_category.should_not be_valid
    new_category.errors.on(:name).should == "has already been taken"
    
    new_category = Category.new(:name => "new name")
    new_category.should be_valid
  end
  
end