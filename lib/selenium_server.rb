module SeleniumServer
  SELENIUM_SERVER_PATH = File.dirname(__FILE__) + '/../features/steps/support/selenium-server.jar' unless defined?(SELENIUM_SERVER_PATH)
  SELENIUM_SERVER_LOG = File.dirname(__FILE__) + '/../log/selenium-server.log' unless defined?(SELENIUM_SERVER_LOG)
  
  def start
    unless `ps x`.grep(/selenium-server/).first
      puts "Starting selenium server"
      fork do
        exec "java -jar #{SELENIUM_SERVER_PATH} >> #{SELENIUM_SERVER_LOG}"
        exit 127
      end
      
      sleep 0.5 while !`netstat -an`.grep(/4444.*LISTEN/).first
    end
  end
  
  def stop
    puts "Stopping Selenium server..."
    selenium_processess = `ps x`.grep(/selenium-server/)
    puts "Selenium server not started" unless selenium_processess.size > 0
    selenium_processess.each { |selenium_process| Process.kill('TERM', selenium_process.split[0].to_i) }
  end
  
  extend self
end