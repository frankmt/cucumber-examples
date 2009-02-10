ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
 
require 'cucumber/rails/world'
require 'cucumber/rails/rspec'
# require 'webrat/rspec-rails'

require 'factory_girl'
require 'spec/factories'

Cucumber::Rails.use_transactional_fixtures