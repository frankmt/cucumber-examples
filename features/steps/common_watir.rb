When /^I press "(.*)"$/ do |button|
  @browser.button(:value, button).click
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
#  
# Then /^I should not see "(.*)"$/ do |text|
#   response.body.should_not =~ /#{text}/m
# end
#  
# Then /^I should see an error message "(.*)"$/ do |message|
#   response.should have_tag(".error-message", message )
# end