Then /^I should see ((\w+\s?)+)$/ do |element|
  case element
  when "a nice page" then nil
  when "my profile data"
    response.should have_content("Your account data")
  end
end
