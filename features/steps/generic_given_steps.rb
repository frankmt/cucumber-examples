Given(/an item exists with \{(.*)\}$/) do |fields|
  fields = instance_eval("{#{fields}}").with_indifferent_access
  parameters = ""
  fields.each_key do |key|
    parameters  = parameters << key.to_s << "=" << fields[key].to_s << "&"
  end
  @browser.goto(ENV['HOST'] + "/factories/create_item?#{parameters}")
end
 
Given(/^I am in the new "(.*)" page$/) do |resource_name|
  @browser.goto(ENV['HOST'] + "/#{resource_name}/new")
end