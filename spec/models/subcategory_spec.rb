require File.dirname(__FILE__) + '/../spec_helper'

describe Subcategory do
  
  it "should validate uniqueness of name" do
    subcategory = Factory :subcategory
    
    new_subcategory = Subcategory.new(:name => subcategory.name)
    new_subcategory.should_not be_valid
    new_subcategory.errors.on(:name).should == "has already been taken"
        
    new_subcategory = Subcategory.new(:name => "new name")
    new_subcategory.should be_valid
  end
  
end