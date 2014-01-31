Feature: signing up
  As a unlogged user
  So that I can access more app features
  I want to create an account

Scenario: successful sign up
  Given I am on the signup page
  And I fill in the following:
  | user_first_name            | John     |
  | user_last_name             | Smith    |
  | user_email                 | j@s.c    |
  | user_password              | password |
  | user_password_confirmation | password |
  And I press "Create my account"
  Then there should exist user with email j@s.c
  And I should see "Sign out"
  And I should not see "Sign up"

Scenario: succesful log in
  Given the following users exist:
  | first_name | last_name | email |
  | John       | Smith     | j@s.c |
  Given I am on the home page
  And I follow "Sign in"
  And I fill in the following:
  | session_email      | j@s.c    |
  | session_password   | password |
  And I press "Sign in"
  Then I should be on the home page
  And I should see "Sign out"
  And I should not see "Sign up"

Scenario: logging off
  Given the following users exist:
  | first_name | last_name | email |
  | John       | Smith     | j@s.c |
  And I am logged in as John Smith
  And I follow "Sign out"
  And I should see "Sign in"
  And I should not see "Sign out"
