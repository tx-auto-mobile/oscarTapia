=begin
Step definition file contains the code of how the steps written in feature file will interact
with the iOS/Android application.
=end

#TODO: Split the step definitions methods in new files to do this maintainable when project grows up
require(File.dirname(__FILE__) + '/../../ui_elements/mobile_app')
require(File.dirname(__FILE__) + '/../../ui_elements/uielements_getter')
require 'minitest'


Then(/^"([^"]*)" button should be present$/) do |arg|
  expected = arg
  actual = @uielement.get_text_of_element("label",arg)
  puts actual
  assert_equal(expected, actual)
end

Then(/^I touch "([^"]*)" button$/) do |arg|
  touch("label marked:'#{arg}'")
end

Then(/^I should see a "([^"]*)" popup$/) do |arg|
  if(@uielement.get_element("label", arg) != nil)
    assert true
  else
    assert(false, "Message is not being displayed " + arg)
  end
end

And(/^I should see "([^"]*)" message$/) do |arg|
  actual_text = @uielement.get_text_of_element("*",arg)
  assert_equal(arg,actual_text,"Text or element is missing")
end

And(/^I should not see the "([^"]*)" popup anymore$/) do |arg|
  if(@uielement.get_element("label",arg) == nil)
    assert true
  else
    puts @uielement.get_element("label",arg)
    assert false
  end
end

And(/^I insert "([^"]*)" text in the "([^"]*)" field$/) do |arg1, arg2|
  @uielement.touch_element("label", arg2)
  keyboard_enter_text arg1
end

Then(/^I tap on "([^"]*)" element$/) do |arg|
  @uielement.touch_element("*", arg)
  #TODO: Implement wait for element method to not hardcode wait times
  sleep 2
end

When(/^I wait and tap on "([^"]*)" element$/) do |arg|
  @uielement.wait_and_touch_element("*", arg)
  #TODO: Implement wait for element method to not hardcode wait times
  sleep 2
end

And(/^I wait until "([^"]*)" screen disappear$/) do |arg|
  @uielement.wait_element_disappear("*", arg)
  sleep 2
end

Given(/^I am in main view$/) do
  element_1 = @uielement.get_element("label","Inbox")
  element_2 = @uielement.get_element("label","Archive")
  element_3 = @uielement.get_element("button","Compose")
  if(element_1 && element_2 && element_3 != nil)
    assert(true)
  else
    assert(false, "One of the elements of main view is missing")
  end
end

When(/^I tap on "([^"]*)" button$/) do |arg|
  @uielement.touch_element("button", arg)
  #TODO: Implement wait for element method to not hardcode wait times
  sleep 2
end

And(/^I see the "([^"]*)" element$/) do |arg|
  element = @uielement.get_element("*",arg)
  if element == nil
    assert(false, "The element " + arg + "is not present")
  else
    assert true
  end
end

Then(/^the number "([^"]*)" should be displayed$/) do |arg|
  element = @uielement.get_element("*",arg)
  if element == nil
    assert(false, "The element " + arg + "is not present")
  else
    assert true
  end
end

And(/^I tap on "([^"]*)" switch$/) do |arg|
  @uielement.touch_element("switch", arg)
  #TODO: Implement wait for element method to not hardcode wait times
  sleep 2
end

And(/^"([^"]*)" switch should have value "([^"]*)"$/) do |arg1, arg2|
  actual_value = @uielement.get_value_of_element("switch", arg1)
  expected_value = arg2
  assert_equal(expected_value, actual_value, "The actual value " + actual_value + "is not the expected " + expected_value)
end

And(/^I touch on "([^"]*)" button$/) do |arg|
  if arg == "I'm sure."
    element = query("UIButtonLabel")[0]
    touch element
  end
end