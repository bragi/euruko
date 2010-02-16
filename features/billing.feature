Feature: Billing
  In order to receive tax return for Euruko registration
  As a user
  I want to provide billing information

  Scenario: Providing billing information
    Given I log in as user
    When I follow "Add billing information"
    And I fill in "Company name" with "Johndoeary ltd."
    And I fill in "Full address" with "12 Some Street\nInteresting City\n90-210\nEven Better Country"
    And I fill in "VAT-ID" with "XX10020929289"
    And I fill in "Other information" with "Tax collectors are nice, really!"
    And I fill in "Notes for organizers" with "Give me a call before sending invoice: 0050012345678"
    And I press "Save"
    Then I should see my profile data
    And I should see "Johndoeary ltd."

  Scenario: Changing billing information
    Given I log in as user
    And I have billing information
    And I go to my profile data
    And I should see "Johndoery Inc."
    And I should not see "Add billing information"
    When I follow "Change billing information"
    And I fill in "Company name" with "John Doery"
    And I press "Save"
    Then I should see my profile data
    And I should see "John Doery"
