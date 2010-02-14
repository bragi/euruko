Feature: Password reset
  In order to gain access to my account after forgetting password
  As a user
  I want to reset password via e-mail
  
  Scenario: Resetting password
    Given user with "email" "forgotten@example.com" exists
    And I go to the home page
    When I follow "Log in"
    And I follow "I have forgotten my password"
    And I fill in "E-mail" with "forgotten@example.com"
    And I press "Reset my password"
    Then I should be on the home page
    And I should see "We have sent you instructions for resetting password via e-mail"
    And "forgotten@example.com" should receive 1 emails
    When "forgotten@example.com" opens the email
    Then I should see "EuRuKo Password Reset" in the email subject
    And I click the first link in the email
    And I fill in "Password" with "newpassword"
    And I fill in "Password confirmation" with "newpassword"
    And I press "Change my password and log me in"
    Then I should see my profile data
    And I should see "Password successfully updated"
