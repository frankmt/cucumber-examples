Given(/a "(.*)" exists with \{(.*)\}$/) do |entity, fields|
  fields = instance_eval("{#{fields}}").with_indifferent_access
  Factory entity.to_sym, fields
end