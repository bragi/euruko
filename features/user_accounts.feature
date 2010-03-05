Feature: User accounts
  In order to participate in Euruko, get notification and pay registration fee
  As a user
  I want to create account

  Scenario: Creating user account
    Given I access the site as guest
    When I go to the user registration page
    When I fill in "E-mail" with "user@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I fill in "First name" with "John"
    And I fill in "Last name" with "Doe"
    And I press "Create my account"
    Then I should see "We will notify you when the registration starts"
