Feature: Authentication
  As a user of pulse
  I should be able to log in
  So that i can use the platform

  Background: Visit sign in page
    Given I visit the sign in page

  Scenario: Invalid Login
    Given I supply invalid credentials
    When I Sign in
    Then I should see error messages

  Scenario: Valid Login
    Given I supply valid credentials
    When I Sign in
    Then I should be successful
