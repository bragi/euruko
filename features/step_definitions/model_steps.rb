Given /^(.*) with "([^\"]*)" "([^\"]*)" exists$/ do |factory, attribute, value|
  Factory.create(factory, {attribute.to_sym => value})
end
