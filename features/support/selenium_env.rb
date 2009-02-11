# require File.expand_path(File.dirname(__FILE__) + '/env.rb')
# require 'webrat/selenium'
#  
# World do
#   Webrat::Selenium::Rails::World.new
# end
#  
# def empty_database
#   $selenium.open("http://localhost:3000/factories/destroy_all")
# end
#  
# Before do
#   empty_database
#   selenium.delete_all_visible_cookies
#   ActionMailer::Base.deliveries = []
# end
#  
# at_exit do
#   empty_database
# end

ENV["RAILS_ENV"] = "test" 
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'
require 'cucumber/formatters/unicode'
require 'webrat/rails'
require 'cucumber/rails/rspec'

Cucumber::Rails.use_transactional_fixtures

Webrat.configure do |config|
  config.mode = :selenium
end

def empty_database
  # open("http://localhost:3000/factories/destroy_all")
end

Before do
  empty_database
end
