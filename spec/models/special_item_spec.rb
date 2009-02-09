require File.dirname(__FILE__) + '/../spec_helper'

describe SpecialItem do
  
  it "should require name" do
    
    item = SpecialItem.new
    item.should_not be_valid
    item.errors.on(:name).should == "can't be blank"
    
    item = SpecialItem.new(:name => "name")
    item.valid?
    item.errors.on(:name).should be_nil
    
  end
  
  it "should require category" do
    
    category = Factory :category

    item = SpecialItem.new
    item.should_not be_valid
    item.errors.on(:category).should == "can't be blank"
    
    item = SpecialItem.new(:category => category)
    item.valid?
    item.errors.on(:category).should be_nil
    
  end

  it "should require subcategory" do
    
    subcategory = Factory :subcategory

    item = SpecialItem.new
    item.should_not be_valid
    item.errors.on(:subcategory).should == "can't be blank"
    
    item = SpecialItem.new(:subcategory => subcategory)
    item.valid?
    item.errors.on(:subcategory).should be_nil
    
  end
  
  it "should validate that the subcategory belongs to the category" do

    subcategory1 = Factory :subcategory
    subcategory2 = Factory :subcategory

    item = SpecialItem.new(:subcategory => subcategory1, :category => subcategory2.category)
    item.should_not be_valid
    item.errors.on(:subcategory).should == "has to belong to the specified category"
    
    item = SpecialItem.new(:subcategory => subcategory1, :category => subcategory1.category)
    item.valid?
    item.errors.on(:subcategory).should be_nil
    
  end

  
end