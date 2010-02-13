Given /^I access the site as guest$/ do
  # Initially do nothing as guest would
end

Given /^I log in as user$/ do
  Given %Q{user with "email" "john@example.com" exists}
  When %Q{I go to the home page}
  And %Q{I follow "Log in"}
  And %Q{I fill in "E-mail" with "john@example.com"}
  And %Q{I fill in "Password" with "user123"}
  And %Q{I press "Log in"}
end

Given /^I log in as admin$/ do
  Given %Q{admin with "email" "john@example.com" exists}
  When %Q{I go to the administration home page}
  And %Q{I fill in "E-mail" with "john@example.com"}
  And %Q{I fill in "Password" with "user123"}
  And %Q{I press "Log in"}
end
