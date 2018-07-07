Feature: Create account
  Create an account to access the application

  Scenario: User needs an account
    Given I am a new user
    When I sign up as Aaron Sumner with email "test@example.com" and password "secret123!"
    Then I am registered as Aaron Sumner
    And I can sign in with email "test@example.com" and password "secret123!"

  Scenario: Password and password confirmation don't match
    Given I am a new user
    When I register with a mismatched password
    Then I am asked to fix the mismatched password

  Scenario: User is already registered
    Given I am already registered with the email "test@example.com"
    When I sign up as Joe Forgetful with email "test@example.com" and password "secret123!"
    Then I am told the email is already in use
