module SeleniumDriverExtensions
  
  WAIT_TIMEOUT = 5000
  
  def location
    get_location
  end
  
  def field(locator)
    get_value locator
  end
  
  def wait_for_element(field_name, time=WAIT_TIMEOUT)
    wait_for_element_present(field_name)
        
    script = <<-EOS
    var element;
    try {
      element = selenium.browserbot.findElement("#{field_name}");
    } catch(e) {
      element = null;
    }
    element != null
    EOS
    
    wait_for_condition(script, time)
  end
  
  def wait_for_element_to_dissapear(field_name, time=WAIT_TIMEOUT)

    script = <<-EOS
    var element;
    try {
      element = selenium.browserbot.findElement("#{field_name}");
    } catch(e) {
      element = null;
    }
    element == null
    EOS
    
    wait_for_condition(script, time)
  end

  def wait_for_visible(field_name, time=WAIT_TIMEOUT)
    script = <<-EOS
    var element;
    try {
      element = selenium.browserbot.findElement("#{field_name}");
    } catch(e) {
      element = null;
    }
    element != null && element.style["display"] != "none"
    EOS
      
    wait_for_condition script, time
  end

  def wait_for_not_visible(field_name, time=WAIT_TIMEOUT)
    script = <<-EOS
    var element;
    try {
      element = selenium.browserbot.findElement("#{field_name}");
    } catch(e) {
      element = null;
    }
    element != null && element.style["display"] != "block"
    EOS
      
    wait_for_condition script, time
  end

  
  def wait_for_text(field_name, text, time=WAIT_TIMEOUT)
    script = <<-EOS
    var element;
    try {
      element = selenium.browserbot.findElement('#{field_name}');
    } catch(e) {
      element = null;
    }
    element != null && element.innerHTML == '#{text}'
    EOS
    
    wait_for_condition script, time
  end

end
