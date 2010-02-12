Feature: User page
  In order to see my account details and news for me
  As a user
  I want to log in and see my details

  Scenario: Accessing my page
    Given I log in as user
    Then I should see "John"
    And I should see "Doe"
    And I should see "We will notify you when the registration starts"
