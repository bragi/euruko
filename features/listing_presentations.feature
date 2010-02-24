Feature: Listing presentatios

  In order to attract a lot of visitors to EuRuKo
  As a guest or user
  I want to see list of presentations, and details about them

  Scenario: Showing the list of presentation
    Given multiple presentation records exist with values
      | topic                                |
      | What's new in Rails 4?               |
      | How to rule the world using cucumber |
    And I access the site as guest
    When go to the home page
    Then I should see "Talks"
    When I follow "Talks"
    Then I should see "What's new in Rails 4?"
    And I should see "How to rule the world using cucumber"
    And I should see "John Doe"
    And I should see "What this presentation is about"
    And I should see presentation photo
    When I follow "What's new in Rails 4?"
    Then I should see "Rails dev with 25 years of field experience"
    And I should see "What this presentation is about"
    And I should see presentation photo
