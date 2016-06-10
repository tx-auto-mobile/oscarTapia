class UIElementsGetter
  include Calabash::Cucumber::WaitHelpers
  include Calabash::Cucumber::KeyboardHelpers
  include Calabash::Cucumber::Operations

  DELAY_COMPONENT_SHOW = 10
  DEFAULT_SYNC_TIME=30

  #TODO: On hold methods in the case app became hybrid
  #def get_by_css(css_class, all=false)
  #  all_elements = all==true ? 'all ' : ''
  #  return query("#{all_elements}webView css:'#{css_class}'")
  #end

  #def get_by_text_content(css_class, text_content,all=false)
  #  all_elements = all==true ? 'all ' : ''
  #  return query("#{all_elements}webView css:'#{css_class}' textContent:'#{text_content}'")
  #end

  # Gets the element specifying the type and the name.
  def get_element(type, name, opt=false)
    #Wait element is causing errors for some scenarios, should find another way for this
    #wait_for_element_exists("#{type} marked:'#{name}'")
    element = query("#{type} marked:'#{name}'").first
    if element == nil
      puts "The element for this type and name is null"
      puts "type: " + type
      puts "name: " + name
    end
    return element
  end

  def wait_and_get_element(type, name)
    wait_for_element_exists("#{type} marked:'#{name}'")
    return get_element(type, name)
  end

  def get_text_of_element(type, name, all=false)
    text = query("#{type} marked:'#{name}'", :text).first
    if text == nil
      text = query("#{type} text:'#{name}'", :text).first
    end
    return text
  end

  def get_value_of_element(type, name)
    result = query("#{type} marked:'#{name}'").first
    value = result["value"]
    puts "EL VALOR ES " + value.to_s
    return value
  end

  def touch_element(type, name)
    element = get_element(type, name)
    touch(element)
  end

  def wait_and_touch_element(type, name)
    element = wait_and_get_element(type, name)
    touch element
  end

  def wait_element_disappear(type, name)
    wait_for_element_does_not_exist("#{type} marked:'#{name}'")
  end

end