When(/^I navigate to the home page$/) do
  @browser.goto(ENV['HOST'] + "/items")
end
 
When(/^I enter \{(.*)\}$/) do |values|
  userEntries = instance_eval("{#{values}}")
  userEntries.each do |label, value|
    @browser.text_field('name', label).set(value)
  end
end