require File.dirname(__FILE__) + '/../spec_helper'

describe Item do
  
  it "should validate presence of name" do
    item = Item.new
    item.valid?
    item.errors.on(:name).should == "Name can't be blank"
    
    item.name = "name"
    item.valid?
    item.errors.on(:name).should be_nil
  end
  
  it "should validate presence of description" do
    item = Item.new
    item.valid?
    item.errors.on(:description).should == "Description can't be blank"
    
    item.description = "description"
    item.valid?
    item.errors.on(:description).should be_nil
  end  
  
end