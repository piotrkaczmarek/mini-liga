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
  Then I should see "John"
  And I should see "Smith"
  And I should see "j@s.c"
  And I should see "700700700"

