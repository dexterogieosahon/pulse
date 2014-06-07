Feature: Block another user
  As a user of Pulse
  I should be able to prevent a user from being added as a friend or his messages seen by others
  So that i can have contorl on people's actions

  Scenario: Block a user
    Given I am signed in
    Given A User "John Doe"
    When I block "John Doe"
    Then he is not visible on Pulse