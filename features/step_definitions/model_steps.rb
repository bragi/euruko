Given /^(.*) with "([^\"]*)" "([^\"]*)" exists$/ do |factory, attribute, value|
  Factory.create(factory, {attribute.to_sym => value})
end

Given /^an? (.*) exists with values$/ do |factory, attributes_table|
  Factory(factory, attributes_table.rows_hash) 
end

Given /^multiple (.*) records exist with values$/ do |factory, records_table|
  records_table.hashes.each do |record|
    Factory(factory, record)
  end
end

Given /^I have (.*)$/ do |model|
  factory = model.gsub(/\s+/, '_')
  Factory.create(factory, {:user => @current_user})
end
