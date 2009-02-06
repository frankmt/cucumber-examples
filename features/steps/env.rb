# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'
Cucumber::Rails.use_transactional_fixtures

# Comment out the next line if you're not using RSpec's matchers (should / should_not) in your steps.
require 'cucumber/rails/rspec'
require 'factory_girl'
require 'spec/factories'

require File.join(File.dirname(__FILE__), "support/selenium")
require File.join(File.dirname(__FILE__), "/../../lib/selenium_server")
require File.join(File.dirname(__FILE__), "support/selenium_driver_extensions")


# RailsServer.start
SeleniumServer.start

remote_control_server = ENV['SELENIUM_REMOTE_CONTROL'] || "localhost"
port = ENV['SELENIUM_PORT'] || 4444
browser = ENV['SELENIUM_BROWSER'] || "*firefox"
application_host = ENV['SELENIUM_APPLICATION_HOST'] || "localhost"
application_port = ENV['SELENIUM_APPLICATION_PORT'] || "3001"
timeout = 60000
puts "Contacting Selenium RC on #{remote_control_server}:#{port} -> http://#{application_host}:#{application_port}"
$selenium = Selenium::SeleniumDriver.new(remote_control_server, port, browser, "http://#{application_host}:#{application_port}", timeout)
$selenium.extend SeleniumDriverExtensions
$selenium.start

ENV["HOST"] = "http://#{application_host}:#{application_port}"
 
# Spec::Runner.configure do |config|
#   config.before :all do
#     $selenium.open(ENV["HOST"] + "/factories/destroy_all")
#     @start_time = Time.now.to_f
#   end
#   
#   config.after :all do
#     puts "Finished in #{Time.now.to_f - @start_time} seconds"
#   end  
#   
# end

Before do
  $selenium.open(ENV['HOST'] + "/factories/destroy_all")
end

at_exit do
  $selenium.stop
  
  SeleniumServer.stop
  # RailsServer.stop
end
