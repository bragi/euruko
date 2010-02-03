Feature: Home page
  In order to join Euruko conference
  As a guest
  I want to see home page of registration app
  
  Scenario: Accessing home page
    Given I access the site as guest
    When go to the home page
    Then I should see a nice page
