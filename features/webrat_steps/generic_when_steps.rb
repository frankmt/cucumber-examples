When(/^I navigate to the home page$/) do
  visit("/items")
end

When(/^I enter \{(.*)\}$/) do |values|
  userEntries = instance_eval("{#{values}}")
  userEntries.each do |label, value|
    fill_in(label, :with => value)
  end
end
