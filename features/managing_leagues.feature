Feature: managing leagues
  As a keeper, employee responsible for managing leagues and tournaments
  So that there can be leagues for players to play in
  I want to create new leagues

Background: keeper is in database and is logged in
  Given the following users exist:
  | id | first_name | last_name | email | type   |
  | 0  | John       | Smith     | j@s.c | Keeper |
  Given I am logged in as John Smith

Scenario: viewing my leagues
  Given the following leagues exist:
  | name  | sport  | weekday | keeper_id |
  | lig   | chess  | 2       | 0         |
  Given I am on the home page
  And I follow "My games"
  Then I should be on my keeper's leagues page
  And I should see "My leagues"
  And I should see "lig"
  And I follow "Details"
  Then I should be on the lig's league edit page

Scenario: creating new league
  Given I am on my keeper's leagues page
  And I follow "Add League"
  

