When(/^I navigate to the home page$/) do
  @browser.goto(ENV['HOST'] + "/items")
end
 
When(/^I enter \{(.*)\}$/) do |values|
  userEntries = instance_eval("{#{values}}")
  userEntries.each do |label, value|
    fills_in(label, :with => value)
  end
end