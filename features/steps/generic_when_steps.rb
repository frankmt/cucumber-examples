When(/^I navigate to the home page$/) do
  $selenium.open(ENV['HOST'] + "/items")
end
 
When (/^I navigate to the special items home page$/) do
  $selenium.open(ENV['HOST'] + "/special_items")
end 
 
When(/^I enter \{(.*)\}$/) do |values|
  userEntries = instance_eval("{#{values}}")
  userEntries.each do |label, value|
    $selenium.type("#{label}", value)
  end
end

When (/^I select category "(.*)" and wait for the subcategory value "(.*)" first "(.*)" second "(.*)" third$/) do |category, value_1, value_2, value_3|
  # $selenium.select("special_item[category_id]", category)
  $selenium.wait_for_dropdown_value_in_correct_position(value_1, "//select[@id='special_item_subcategory_id']/option[1]")
  # $selenium.wait_for_dropdown_value_in_correct_position(value_2, '2')
  # $selenium.wait_for_dropdown_value_in_correct_position(value_3, '3')
end







