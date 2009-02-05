require File.dirname(__FILE__) + '/../spec_helper'

describe ItemsController do
  
  it "should render index" do
    response = get :index
    response.status.should == "200 OK"
  end
  
  it "should render new" do
    response = get :new
    response.status.should == "200 OK"    
  end
  
  describe "create" do

    it "should not create item on failure" do
      response = post :create
      Item.count.should == 0
    end
    
    it "should flash message on success" do
      response = post :create, :item => {:name => "My item", :description => "really cool item", :price => 1.50}
      response.flash[:notice].should == "Item successfully created"
    end
    
    it "should redirect to index on success" do
      response = post :create, :item => {:name => "My item", :description => "really cool item", :price => 1.50}
      response.should redirect_to(items_url)
    end

  end
  
  
  describe "destroy" do
    
    before(:each) do
      @item = Factory :item
    end

    it "should flash message on success" do
      response = delete :destroy, :id => @item.id
      response.flash[:notice].should == "Item successfully destroyed"
    end
    
    it "should redirect to index on success" do
      response = delete :destroy, :id => @item.id
      response.should redirect_to(items_url)
    end

  end
  
end