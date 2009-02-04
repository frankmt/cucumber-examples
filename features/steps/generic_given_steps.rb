Given(/an item exists with \{(.*)\}$/) do |fields|
  @browser.goto(ENV['HOST'] + "/items/new")
  fields = instance_eval("{#{fields}}").with_indifferent_access
  fields.each do |label, value|
    @browser.text_field('name', "item[#{label}]").set(value)
  end
  @browser.button(:value, "Create Item").click
end
 
Given(/^I am in the new "(.*)" page$/) do |resource_name|
  @browser.goto(ENV['HOST'] + "/#{resource_name}/new")
end