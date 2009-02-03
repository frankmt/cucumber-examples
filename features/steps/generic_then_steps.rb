Then(/^the "(.*)" page should be displayed$/) do |page_name|
  @browser.url.should =~ /\/#{page_name}$/
  
end
 
Then(/^the new "(.*)" page should be displayed$/) do |resource|
  @browser.url.should =~ /\/#{resource}\/new$/
end
 
Then(/^I should see the fields with values \{(.*)\}$/) do |fields_data|
  expected_fields = instance_eval("{#{fields_data}}")
  expected_fields.each do |label, value|
    field_value(label).should == value
  end
end
 
Then(/^the "(.*)" should look like$/) do |table_id, definition_table|
  column_headers = []
  current_scope.dom.search("//table[@id='#{table_id}']//th").each { |h| column_headers << h.text.strip }
  
  if column_headers.size == 0
    raise "table #{table_id} wasn't found! 8-B"
  end
 
  definition_table.raw[0].each do |definition_header|
    column_headers.should include(definition_header)
  end
 
  definition_table.hashes.each_with_index do |definition_table_row, row_index|
    
    if current_scope.dom.search("//table[@id='#{table_id}']/tbody")
      html_row = current_scope.dom.search("//table[@id='#{table_id}']/tbody/tr[#{row_index + 1}]/td")
    else
      html_row = current_scope.dom.search("//table[@id='#{table_id}']//tr[#{row_index + 2}]/td")
    end
 
    column_headers.each_with_index do |header, column_index|
      unless definition_table_row[header].nil?
        raise "column #{header} was nil, but should have been #{definition_table_row[header]}" if html_row[column_index].nil?
        html_row[column_index].text.strip.should =~ Regexp.new(definition_table_row[header], Regexp::MULTILINE)
      end
    end
  
  end
end