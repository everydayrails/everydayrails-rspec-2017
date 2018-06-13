Feature: Create account
  Create an account to access the application

  Scenario: User needs an account
    Given I am a new user
    When I register for an account
    Then I am a registered user
