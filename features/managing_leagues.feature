Feature: managing leagues
  As a keeper, employee responsible for managing leagues and tournaments
  So that there can be leagues for players to play in
  I want to create new leagues

Background: keeper is in database and is logged in
  Given there is club named Fit Plant in Warsaw city
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
  And I follow "Edit"
  Then I should be on the lig's league edit page

Scenario: creating new league
  Given I am on my keeper's leagues page
  And I follow "Add league"
  And I fill in the following:
  | league_name                  | FIT     |
  | league_sport                 | tenis   |
  | league_max_number_of_players | 30      |
  | league_prize                 | nobel   |
  And I select Monday in league "weekday"
  And I press "Create" 
  Then league FIT should exist
  
Scenario: submiting invalid information when creating new league
  Given I am on my keeper's leagues page
  And I follow "Add league"
  And I fill in the following:
  | league_name  | FIT   |
  | league_sport | box   |
  And I press "Create"
  Then league FIT should not exist
  And I should see "error"

Scenario: editing league
  Given the following leagues exist:
  | id | name  | sport  | weekday | keeper_id |
  | 0  | lig   | chess  | 2       | 0         |
  Given I am on the lig's league edit page
  Then I should see "Season 1"
  And I fill in the following:
  | meeting_date | 5.5.2014 |
  And I press "Add"
  Then I should see "5.5.2014"


