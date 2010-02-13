Feature: Presentation management
  In order to allow participants to view information about presentations
  As an admin
  I want to manage submitted presentations

  Scenario: Adding presentation
    Given user with "email" "speaker@example.com" exists
    And I log in as admin
    And I follow "New" within "li.presentations"
    Then I should see "Describe new presentation"
    And I fill in "Topic" with "Clusters on Rails"
    And I fill in "Description" with "Short introduction on how to create a cluster of Rails machines"
    And I fill in "Speaker information" with "Rails developer with 10 years of experience"
    And I fill in "Speaker email" with "speaker@example.com"
    And I choose "1 hour"
    And I press "Submit presentation"
    Then I should see "All presentations"
    And I should see "Clusters on Rails"
