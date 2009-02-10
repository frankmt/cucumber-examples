Given(/an item exists with \{(.*)\}$/) do |fields|
  fields = instance_eval("{#{fields}}")
  parameters = ""
  fields.each_key do |key|
    parameters = parameters << key.to_s << "=" << fields[key].to_s << "&"
  end
  $selenium.open(ENV['HOST'] + "/factories/create_item?#{parameters}")
end
 
Given(/^I am in the new "(.*)" page$/) do |resource_name|
  $selenium.open(ENV['HOST'] + "/#{resource_name}/new")
end