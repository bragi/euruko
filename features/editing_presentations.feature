Feature: editing presentations
  In order to make Euruko presentations even more interesting
  As a speaker
  I want to update my presentation details

  Scenario: Editing presentation
    Given I log in as user
    And I have presentation
    When I go to my profile data
    And I follow "Edit" within "#presentations"
    And I fill in the following:
      | Topic               | Even better topic       |
      | Description         | Even better description |
      | Speaker information | The best speaker ever   |
    And I choose "Lightning talk"
    And I press "Update presentation"
    Then I should see "Your account data"
    And I should see "Even better topic" within ".topic"
    And I should see "Even better description" within ".description"
    And I should see "The best speaker ever" within ".speaker"
    And I should see "Lightning talk" within ".length"
