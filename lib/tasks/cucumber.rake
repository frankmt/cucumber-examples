$:.unshift(RAILS_ROOT + '/vendor/plugins/cucumber/lib')
require 'cucumber/rake/task'

namespace :features do
  Cucumber::Rake::Task.new(:pending) do |t|
    t.cucumber_opts = "--format pretty"
    t.feature_pattern = "features/pending/**/*.feature"
  end
  task :pending => 'db:test:prepare'
  
  Cucumber::Rake::Task.new(:done) do |t|
    t.cucumber_opts = "--format progress"
    t.feature_pattern = "features/done/**/*.feature"
  end
  
  Cucumber::Rake::Task.new(:webrat) do |t|
    t.cucumber_opts = "--format progress"
    t.step_pattern = ["features/webrat_steps/**/*.rb","features/support/webrat_env.rb"]
    t.feature_pattern = "features/**/*_webrat.feature"
  end
  
  Cucumber::Rake::Task.new(:selenium) do |t|
    t.cucumber_opts = "--format progress"
    t.step_pattern = ["features/selenium_steps/**/*.rb","features/support/selenium_env.rb"]
    t.feature_pattern = "features/**/*_selenium.feature"
  end
  
  task :done => 'db:test:prepare'
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format progress"
end

task :features => 'db:test:prepare'  

