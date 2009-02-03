Given(/a "(.*)" exists with \{(.*)\}$/) do |entity, fields|
  fields = instance_eval("{#{fields}}").with_indifferent_access
  Factory entity.to_sym, fields
end
 
Given(/^I am in the new "(.*)" page$/) do |resource_name|
  visits "/#{resource_name}/new"
end