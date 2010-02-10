Then /^I should see ((?:\w+\s?)+)$/ do |element|
  case element
  when "a nice page" then nil
  when "my profile data"
    page.should have_content("Your account data")
  end
end
