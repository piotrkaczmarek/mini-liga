Feature: managing users
  As an admin
  So that I can give special rights to employees's accounts
  I want to manage accounts

Background: users in database 
  Given the following users exist:
  | first_name | last_name | email | type   |
  | John       | Smith     | j@s.c | Admin  |
  | Paul       | Smith     | p@s.c | Player |
  Given I am logged in as John Smith

Scenario: viewing users
  Given I am on the home page
  And I follow "Manage users"
  Then I should see "John"
  And I should see "Paul"
  And I should see "Player"
  Then I follow "Details..." within "tr#user_2"
  And I should not see "John"
  And I should see "Paul"

Scenario: promoting users
  Given I am on the users page
  And user Paul Smith should be Player
  And I follow "Keeper" within "tr#user_2"
  And user Paul Smith should be Keeper
