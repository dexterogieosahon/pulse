Feature: Social
  As a user of Pulse
  I should be able to meet new people
  So that i can make new friends and share information

  Background: Setup users
    Given I am signed in
    Given A User "John Doe"

@javascript
  Scenario: Add Friend
    When I request to befriend "John Doe"
    Then we should be friends

@javascript
  Scenario: Remove Friend
    When I request to befriend "John Doe"
    Then we should be friends
    When I view my friend list
    And I demand to breakup with him
    Then we are no longer friends
