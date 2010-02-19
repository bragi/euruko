Feature: User list
  In order to know who is going to Euruko and if any of my friends are going
  As a guest
  I want to see the list of users registered for the conference
  
  Scenario: Listing users
    Given user with "last_name" "Yukihiro" exists
    And user with "last_name" "Ragnarson" exists
    When I go to the home page
    And I follow "Users"
    Then I should see "Yukihiro"
    And I should see "Ragnarson"
    And I should see gravatar