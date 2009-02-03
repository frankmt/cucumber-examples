require File.dirname(__FILE__) + '/../spec_helper'

describe ItemsController do
  
  it "should render index" do
    response = get :index
    response.status.should == "200 OK"
  end
  
end