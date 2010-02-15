Feature: User authentication
  In order to access my account
  As a user
  I want to log in with my previously provided credentials
  
  Scenario: Logging in
    Given user with "email" "john@example.com" exists
    When I go to the home page
    And I follow "Log in"
    And I fill in "E-mail" with "john@example.com"
    And I fill in "Password" with "user123"
    And I press "Log in"
    Then I should see "We will notify you when the registration starts"

  Scenario: Logging out
    Given I log in as user with email "john@example.com"
    Then I should see my profile data
    When I press "Log out"
    Then I should not be logged in
