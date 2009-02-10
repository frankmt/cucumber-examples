def field_value(label)
  field_found = dom_element_with_label(label)

  if(field_found.name == "select")
    options = available_options(field_found)
    option_selected = options.select do |option|
      option.get_attribute("selected") == "selected"
    end

    if(!option_selected.empty?)
      option_selected.first.text
    else
      options.first.text
    end
  else
    field_found['value'] || field_found.text
  end
end

def available_options(field_or_label, &mapper)
  field = field_or_label.class == String ? dom_element_with_label(field_or_label) : field_or_label

  options = []
  if(field.name == "select")
    options = field.children.select do |option|
      option.name == "option"
    end
  end

  options = options.map(&mapper) if !mapper.nil?
  options
end

def dom_element_with_label(label_text)
  label = dom_element_with_text(label_text)

  id = label.get_attribute("for")
  current_scope.dom.search("[id=#{id}]").first
end

def dom_element_with_text(label_text)
  current_scope.dom.search("label").find do |field|
    field.text == label_text
  end
end

def fieldset_with_legend(legend_text)
  current_scope.dom.search("fieldset/legend").find do |legend|
    legend.text == legend_text
  end.parent
end

def click_link_in_table(table_id, text, link_text)
  tr_nodes = current_scope.dom.search("//table[@id='#{table_id}']//tr")
  found_link = false
  tr_nodes.each_with_index do |tr_node, index|
    if tr_node.to_s =~ /#{text}/
        tr_node.search(".//a").each do | anchor_node |
          if anchor_node.to_s =~ /#{link_text}/ || anchor_node['alt'] =~ /#{link_text}/
            found_link = true
            Webrat::Link.new(self, anchor_node).click()
          end
        end
    end
  end
  if(!found_link)
    raise "link wasn't found"
  end
end

def find_info_in_table(table_id, text)
  expected_text = instance_eval("[#{text}]")
  td_nodes = current_scope.dom.search("//table[@id='#{table_id}']//td")
  found_info = false
  expected_text.each do |element_of_expected_text|
    td_nodes.each_with_index do |td_node, index|
      if td_node.to_s =~ /#{element_of_expected_text}/
          found_info = true
      end
    end
    if(!found_info)
      raise " #{element_of_expected_text} wasn't found"
    end
    found_info = false
  end
end

def invert_find_info_in_table(table_id, text)
  expected_text = instance_eval("[#{text}]")
  td_nodes = current_scope.dom.search("//table[@id='#{table_id}']//td")
  found_info = false
  expected_text.each do |element_of_expected_text|
    td_nodes.each do |td_node|
      if td_node.to_s =~ /#{element_of_expected_text}/
          found_info = true
      end
    end
    if(found_info)
      raise " #{element_of_expected_text} was found in the table"
    end
    found_info = false
  end
end

def find_info_alltogether_in_table(table_id, text)
  expected_texts = instance_eval("[#{text}]")
  tr_nodes = current_scope.dom.search("//table[@id='#{table_id}']//tr")
  tr_nodes.each do |tr_node|
    td_nodes = tr_node.search("//td")
    
    found_info = {}
    expected_texts.each do |expected_text|
      td_nodes.each do |td_node|
        if td_node.to_s =~ /#{expected_text}/
            found_info[expected_text] = true
        end
      end
    end
    
    unless(found_info.size == expected_texts.size)
      raise "#{(expected_texts - found_info.keys).inspect} was not found in the table"
    end      
  end
end

def find_info_in_label_of_powerfeed_table(table_id, text)
  expected_texts = instance_eval("[#{text}]")
  tr_nodes = current_scope.dom.search("//table[@id='#{table_id}']//tr")
  tr_nodes.each do |tr_node|
    label_nodes = tr_node.search("//td//label")
    
    found_info = {}
    expected_texts.each do |expected_text|
      label_nodes.each do |label_node|
        if label_node.to_s =~ /#{expected_text}/
            found_info[expected_text] = true
        end
      end
    end
    
    unless(found_info.size == expected_texts.size)
      raise "#{(expected_texts - found_info.keys).inspect} was not found in the table"
    end      
  end
end
  
def click_rails_button_in_table(table_id, text, button_id_prefix)
  current_scope.dom.search("//table[@id='#{table_id}']/tr").each do |tr_node|
    if tr_node.to_s =~ /#{text}/
      tr_node.search(".//a").each do | anchor_node |
        if anchor_node["id"] =~ /^#{button_id_prefix}/
          Webrat::Link.new(self, anchor_node).click()
        end
      end
    end
  end
end

def verify_order_of_ids_in_table(table_id, row_id_prefix, ids)
  all_ids = []
  current_scope.dom.search("//table[@id='#{table_id}']//tr").each do |tr|
    all_ids << tr["id"]
  end

  index_of_previous_identifier = -1
  ids.each do |id|
    index_of_current_identifier = 0
    id_was_found = false

    all_ids.each_with_index do |found_id, index|
      if found_id == "#{row_id_prefix}_#{id}"
        index_of_current_identifier = index
        if(index_of_current_identifier <= index_of_previous_identifier)
          fail "out of order, #{id} was too early"
        end
        index_of_previous_identifier = index_of_current_identifier
        id_was_found = true
      end
    end

    fail "#{id} was not found in #{all_ids}" if !id_was_found
  end
end

def verify_order_of_cells_in_table_column(table_id, column_header, list_of_values)
  table_headers = current_scope.dom.search("//table[@id='#{table_id}']/thead/tr[1]/th/text()")
  col_no = 1
  table_headers.each do |header|
    if (header.to_s.strip == column_header)
      break
    end
    col_no = col_no + 1
  end

  cell_values = []

  table_cells = current_scope.dom.search("//table[@id='#{table_id}']/tbody/tr/td[#{col_no}]/text()")
  table_cells.each do |cell|
    cell_values << cell.to_s.strip
  end

  cell_values.should == list_of_values
end
