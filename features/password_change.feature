Feature: Password reset
  In order to manage my password for security reason
  As a user
  I want to change my password
  
  Scenario: Changing password
    Given I log in as user
    When I follow "Change password"
    And I fill in "Password" with "newpassword"
    And I fill in "Password confirmation" with "newpassword"
    And I press "Change my password"
    Then I should see "Password successfully changed"
