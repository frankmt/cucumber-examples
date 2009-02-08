# require File.expand_path(File.dirname(__FILE__) + '/env.rb')
# require 'webrat/selenium'
# # require File.expand_path(File.dirname(__FILE__) + '/../../lib/webrat_hacks.rb')
#  
# World do
#   Webrat::Selenium::Rails::World.new
# end
#  
# def empty_database
#   connection = ActiveRecord::Base.connection
#   connection.tables.each do |table|
#     connection.execute "DELETE FROM #{table}" 
#   end
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