Then(/^the "(.*)" page should be displayed$/) do |page_name|
  request.request_uri.should =~ /\/#{page_name}$/
end

Then(/^the new "(.*)" page should be displayed$/) do |resource|
  request.request_uri.should =~ /\/#{resource}\/new$/
end

Then(/^I should see the fields with values \{(.*)\}$/) do |fields_data|
  expected_fields = instance_eval("{#{fields_data}}")
  expected_fields.each do |label, value|
    field_value(label).should == value
  end
end


