require 'watir'
require 'cucumber'

Given(/^a user login to application$/) do
  @browser=Watir::Browser.new :chrome
  @browser.goto "http://www.exercise1.com"
end

When(/^they go to currency page$/) do
  @browser.goto "http://www.exercise1.com/values"
end

Then(/^they see five records in currency table$/) do
  $num = browser.elements(:xpath => "//*[starts-with(@id,'txt_val_')]").size
  assert($num == 5)
end

Then(/^they see all the values in currency format$/) do
  elem = browser.elements(:xpath => "//*[starts-with(@id,'txt_val_')]")
  elem.each do |e|
    $val=e.attribute_value('value')
    assert($val[0] == "$")
  end
end

Then(/^they see all the values are greater than 0$/) do
  elem = browser.elements(:xpath => "//*[starts-with(@id,'txt_val_')]")
  elem.each do |e|
    $val=e.attribute_value('value')
    $amt='%.2f' % $val.delete( "$" ).to_f
    assert($amt>0)
  end
end

Then(/^they see the total balance is sum of all listed values$/) do
  $total=0
  elem = browser.elements(:xpath => "//*[starts-with(@id,'txt_val_')]")
  elem.each do |e|
    $val=e.attribute_value('value')
    $amt='%.2f' % $val.delete( "$" ).to_f
    $total=$total+$amt
  end
  $total_bal=browser.elements(:id => "txt_ttl_val").attribute_value('value')
  assert($total_bal == $total)  
end