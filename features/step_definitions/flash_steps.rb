When /^I should see flash "([^\"]*)"$/ do |flash_content|
  flash[:notice].should == "flash_content"
end
