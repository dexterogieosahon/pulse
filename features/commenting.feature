Feature: Commenting
  As a user of Pulse
  I should be able to give comments about other people's messages
  So that i can share my opinion

  Scenario: Leave a comment
    Given I am signed in
    When I view my profile
    When I create a message "General Gossip"
    When I view the message "General Gossip"
    And I leave the comment "My thoughts on your message is brite."
    Then I should see the comment "My thoughts on your message is brite."