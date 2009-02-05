# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'
Cucumber::Rails.use_transactional_fixtures

# Comment out the next line if you're not using RSpec's matchers (should / should_not) in your steps.
require 'cucumber/rails/rspec'
require 'firewatir'
require 'factory_girl'
require 'spec/factories'

include FireWatir

ENV["HOST"] = "http://localhost:3000"
 
# "before all"
browser = Firefox.new
 
Before do
  @browser = browser
  @browser.goto(ENV['HOST'] + "/factories/destroy_all")
end

# "after all"
at_exit do
  browser.close
end
