require 'factory_girl'
require 'spec/factories'
 
class FactoriesController < ApplicationController
  
  def create_item
    if ENV['RAILS_ENV'] == 'test'
      data = {}
      data[:name] = params[:name] if params[:name]
      data[:description] = params[:description] if params[:description]
      data[:price] = params[:price] if params[:price]
      Factory :item, data
    end
    
    redirect_to root_url
  end
  
  def destroy_all
    if ENV['RAILS_ENV'] == 'test'
      Item.destroy_all
    end
    
    redirect_to root_url
  end
  
end