Feature: Submitting presentations
  In order to make Euruko more interesting and gain applause
  As a registered user
  I want to submit my presentation

  Scenario: Submitting presentation
    Given I log in as user
    And I follow "Submit presentation"
    Then I should see "Describe your presentation"
    And I fill in "Topic" with "Clusters on Rails"
    And I fill in "Description" with "Short introduction on how to create a cluster of Rails machines"
    And I fill in "Speaker information" with "Rails developer with 10 years of experience"
    And I choose "1 hour"
    And I press "Submit presentation"
    Then I should see my profile data
    And I should see "Your presentations"
    And I should see "Clusters on Rails"
