Feature: Change password
  In order to manage my password for security reason
  As a user
  I want to change my password
  
  Background:
    Given an user exists with values 
      | password              | oldpassword      |
      | password_confirmation | oldpassword      |
      | email                 | john@example.com |
    When I go to the home page
    And I follow "Log in"
    And I fill in "E-mail" with "john@example.com"
    And I fill in "Password" with "oldpassword"
    And I press "Log in"

  Scenario: Change password with old password correct
    When I follow "Change password"
    And I fill in "Old password" with "oldpassword"
    And I fill in "Password" with "newpassword"
    And I fill in "Password confirmation" with "newpassword"
    And I press "Change my password"
    Then I should see "Password successfully changed"

  Scenario: Change password with old password incorrect
    When I follow "Change password"
    And I fill in "Old password" with "incorrect"
    And I fill in "Password" with "newpassword"
    And I fill in "Password confirmation" with "newpassword"
    And I press "Change my password"
    Then I should see "Old password is incorrect"
