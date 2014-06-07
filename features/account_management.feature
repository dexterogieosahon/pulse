Feature: Account Management
  As a user of Pulse
  I should be able to update my information

  Scenario: Edit Account
    Given I visit the sign in page
    And I supply valid credentials
    And I Sign in
    And I visit Edit Account page
    When I change my name to "Prince Oberin"
    And submit my changes
    Then my name should be "Prince Oberin"