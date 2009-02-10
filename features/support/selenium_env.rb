require File.expand_path(File.dirname(__FILE__) + '/env.rb')

require File.join(File.dirname(__FILE__), "../selenium_steps/support/selenium")
require File.join(File.dirname(__FILE__), "/../../lib/selenium_server")
require File.join(File.dirname(__FILE__), "../selenium_steps/support/selenium_driver_extensions")
 
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
 
Before do
  $selenium.open(ENV['HOST'] + "/factories/destroy_all")
end
 
at_exit do
  $selenium.stop  
  SeleniumServer.stop
end