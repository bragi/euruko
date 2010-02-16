Given /^(.*) with "([^\"]*)" "([^\"]*)" exists$/ do |factory, attribute, value|
  Factory.create(factory, {attribute.to_sym => value})
end

Given /^I have (.*)$/ do |model|
  factory = model.gsub(/\s+/, '_')
  Factory.create(factory, {:user => @current_user})
end
