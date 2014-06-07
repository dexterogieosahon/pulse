Feature: Message
  As a user of Pulse
  I should be able to post messages
  I should be able to see the messages of my friends

  Background: Setup up user
    Given A User "John Doe"
    Given I am signed in

  Scenario: Post a message
    When I view my profile
    When I create a message "General Gossip"
    Then I should see the message "General Gossip"

  Scenario: Show all messages from Friends
    Given he creates a message "Off to Germany!"
    Given he creates a message "Brew some code, and drink some beer!"
    Given "John Doe" and I are friends
    When I view my profile
    Then I should see all messages from my friends

  Scenario: Lookup another user and his messages
    Given he creates a message "Off to Germany!"
    Given he creates a message "Brew some code, and drink some beer!"
    When I visit "John Doe"'s profile
    Then I should see all his messages "Off to Germany!" and "Brew some code, and drink some beer!"