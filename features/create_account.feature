Feature: Create account
  Create an account to access the application

  Scenario: User needs an account
    Given I am a new user
    When I register for an account
    Then I am a registered user

  Scenario: Password and password confirmation don't match
    Given I am a new user
    When I register with a mismatched password
    Then I am asked to fix the mismatched password
