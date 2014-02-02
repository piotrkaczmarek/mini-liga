Feature: managing own account
  As a user with account
  So that I can manage my account
  I want to be able to view and change my account data

Background: player is in database and is logged in
  Given there is club named Fit Plant in Warsaw city
  Given the following users exist:
  | id | first_name | last_name | email | type   | phone_number |
  | 0  | John       | Smith     | j@s.c | Player | 700700700    |
  Given I am logged in as John Smith

Scenario: viewing my account
  Given I am on the home page
  And I follow "My account"
  Then I should be on the John Smith's user page
  Then I should see "John"
  And I should see "Smith"
  And I should see "j@s.c"
  And I should see "700700700"

Scenario: editing my profile
  Given I am on the John Smith's user page
  And I press "Edit"
  Then I should be on the John Smith's user edit page
  And I fill in the following:
  | user_last_name | Blacksmith |
  And I press "Edit"
  Then I should be on the John Blacksmith's user page
  And user John Smith should not exist

Scenario: changing my password
  Given I am on the John Smith's user page
  And I press "Change password"
  Then I should be on the reset password page
  And I fill in the following:
  | user_password              | foobar |
  | user_password_confirmation | foobar |
  And I press "Change"
  Then I follow "Sign out"
  And I follow "Sign in"
  And I fill in the following:
  | session_email      | j@s.c    |
  | session_password   | foobar   |
  And I press "Sign in"
  Then I should be on the home page
  And I should see "Sign out"
