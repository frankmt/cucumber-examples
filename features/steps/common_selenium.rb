When /^I press "(.*)"$/ do |button|
  $selenium.click_and_wait("css=input[value='#{button}']")
end

When /^I press "(.*)" and confirm my option$/ do |button|
  $selenium.choose_ok_on_next_confirmation
  $selenium.click("css=input[value='#{button}']")
end

When /^I press "(.*)" and do not confirm my option$/ do |button|
  $selenium.choose_cancel_on_next_confirmation
  $selenium.click("css=input[value='#{button}']")
end

When /^I follow "(.*)"$/ do |link|
  $selenium.click_and_wait("css=a[value='#{link}']")
end
 
When /^I fill in "(.*)" with "(.*)"$/ do |field, value|
  $selenium.type("css=input[name='#{field}']", value)
end
 
Then /^I should see "(.*)"$/ do |text|
  assert($selenium.get_body_text.include?(text))
end
 
Then /^I should not see "(.*)"$/ do |text|
  assert(!$selenium.get_body_text.include?(text))
end
