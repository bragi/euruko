Feature: Billing
  In order to receive tax return for Euruko registration
  As a user
  I want to provide billing data

  Scenario: Providing billing data
    Given I log in as user
    When I follow "Add billing data"
    Then I should see billing data form
    When I fill in "Company name" with "Johndoeary ltd."
    And I fill in "Full address" with "
  12 Some Street
  Interesting City
  90-210
  Even Better Country
"
    And I fill in "VAT-ID" with "XX10020929289"
    And I fill in "Other information" with "Tax collectors are nice, really!"
    And I fill in "Notes for organizers" with "Give me a call before sending invoice: 0050012345678"
    And I press "Save"
    Then I should see my profile data
    And I should see "Johndoeary ltd."