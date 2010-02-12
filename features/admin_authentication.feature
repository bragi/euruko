Feature: Admin authentication
  In order to access my account
  As a admin
  I want to log in with my credentials

  Scenario: Logging in as admin
    Given admin with "email" "john@example.com" exists
    When I go to the administration home page
    Then I should see "Please log in"
    When I fill in "E-mail" with "john@example.com"
    And I fill in "Password" with "user123"
    And I press "Log in"
    Then I should see "You are now logged in as admin"
