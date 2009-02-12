Then(/^the "(.*)" page should be displayed$/) do |page_name|
  $selenium.get_location =~ /\/#{page_name}$/
end
 
Then(/^the new "(.*)" page should be displayed$/) do |resource|
  $selenium.get_location =~ /\/#{resource}\/new$/
end

Then(/^I should see error "(.*)" on name field$/) do |error|
  $selenium.get_text("//label[@for = 'special_item_name']/../..//div[@class='formError']").should == error
end
 
Then(/^the "(.*)" should look like$/) do |table_id, definition_table|
  column_headers = []
  $selenium.get_text("//table[@id='#{table_id}']//tr").split(" ").each { |h| column_headers << h.strip }
  if column_headers.size == 0
    raise "table #{table_id} wasn't found! 8-B"
  end
 
  definition_table.raw[0].each do |definition_header|
    column_headers.should include(definition_header)
  end
 
  definition_table.hashes.each_with_index do |definition_table_row, row_index|
    column_headers.each_with_index do |header, column_index|
      unless definition_table_row[header].nil?
        cell = $selenium.get_table("//table[@id='#{table_id}'].#{row_index + 1}.#{column_index}")
        raise "column #{header} was nil, but should have been #{definition_table_row[header]}" if cell.nil?
        cell.should =~ Regexp.new(definition_table_row[header], Regexp::MULTILINE)
      end
    end
  
  end
end