When /^I press "(.*)"$/ do |button|
  @browser.button(:value, button).click
end
 
When /^I follow "(.*)"$/ do |link|
  @browser.link(:value, link).click
end
#  
# When /^I fill in "(.*)" with "(.*)"$/ do |field, value|
#   fills_in(field, :with => value)
# end
#  
# When /^I select "(.*)" from "(.*)"$/ do |value, field|
#   selects(value, :from => field)
# end
#  
# When /^I check "(.*)"$/ do |field|
#   checks(field)
# end
#  
# When /^I uncheck "(.*)"$/ do |field|
#   unchecks(field)
# end
#  
# When /^I choose "(.*)"$/ do |field|
#   chooses(field)
# end
#  
# When /^I attach the file at "(.*)" to "(.*)" $/ do |path, field|
#   attaches_file(field, path)
# end
#  
# Then /^I should see "(.*)"$/ do |text|
#   response.body.should =~ /#{text}/m
# end
#  
# Then /^I should not see "(.*)"$/ do |text|
#   response.body.should_not =~ /#{text}/m
# end
#  
# Then /^I should see a message "(.*)"$/ do |message|
#   response.should include_text(message)
# end
#  
# Then /^I should see an error message "(.*)"$/ do |message|
#   response.should have_tag(".error-message", message )
# end