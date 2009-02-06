When(/^I navigate to the home page$/) do
  $selenium.open(ENV['HOST'] + "/items")
end
 
When(/^I enter \{(.*)\}$/) do |values|
  userEntries = instance_eval("{#{values}}")
  userEntries.each do |label, value|
    $selenium.type("#{label}", value)
  end
end
