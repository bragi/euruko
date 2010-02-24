Given /^(.*) with "([^\"]*)" "([^\"]*)" exists$/ do |factory, attribute, value|
  Factory.create(factory, {attribute.to_sym => value})
end

Given /^an? (.*) exists with values$/ do |factory,attributes_table|
  Factory(factory, attributes_table.rows_hash) 
end

Given /^I have (.*)$/ do |model|
  factory = model.gsub(/\s+/, '_')
  Factory.create(factory, {:user => @current_user})
end
