require File.dirname(__FILE__) + '/../spec_helper'

describe SpecialItemsController do
  
  it "should render index" do
    response = get :index
    response.status.should == "200 OK"
  end
  
  it "should render new" do
    response = get :new
    response.status.should == "200 OK"    
  end
  
  describe "create" do
    
    before(:each) do
      @category = Factory :category
      @subcategory = Factory :subcategory, :category => @category
    end

    it "should not create item on failure" do
      response = post :create
      SpecialItem.count.should == 0
    end
    
    it "should flash message on success" do
      response = post :create, :special_item => {:name => "My item", :category => @category, :subcategory => @subcategory}
      response.flash[:notice].should == "Special Item successfully created"
    end
    
    it "should redirect to index on success" do
      response = post :create, :special_item => {:name => "My item", :category => @category, :subcategory => @subcategory}
      response.should redirect_to(special_items_url)
    end

  end
  
  
  describe "destroy" do
    
    before(:each) do
      category = Factory :category
      subcategory = Factory :subcategory, :category => category
      @special_item = Factory :special_item, :name => "item_#{rand(100)}", :category => category, :subcategory => subcategory
    end

    it "should flash message on success" do
      response = delete :destroy, :id => @special_item.id
      response.flash[:notice].should == "Special Item successfully destroyed"
    end
    
    it "should redirect to index on success" do
      response = delete :destroy, :id => @special_item.id
      response.should redirect_to(special_items_url)
    end

  end
  
end