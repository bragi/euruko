Then /^I should see ((?:\w+\s?)+)$/ do |element|
  case element
  when "a nice page" then nil
  when "my profile data"
    page.should have_content("Your account data")
  when 'presentation photo'
    page.body.should have_tag("img", :src => /presentation.png/)
  else
    raise "unknown element, provide description in 'features/step_definitions/pages_steps.rb'"
  end
end
