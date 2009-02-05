When /^I press "(.*)"$/ do |button|
  @browser.button(:value, button).click
end

When /^I press "(.*)" expecting a confirmation message$/ do |button|
  @browser.button(:value, button).click_no_wait
end
 
When /^I follow "(.*)"$/ do |link|
  @browser.link(:value, link).click
end
 
When /^I fill in "(.*)" with "(.*)"$/ do |field, value|
  @browser.text_field('name', field).set(value)
end
 
Then /^I should see "(.*)"$/ do |text|
  assert(@browser.text.include?(text))
end
 
Then /^I should not see "(.*)"$/ do |text|
  assert(!@browser.text.include?(text))
end
