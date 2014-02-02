Feature: subscribing for meeting
  As a player
  So that I play match in a meeting
  I want to subscribe for a meeting

Background: league,keeper and player are in database and is logged in
  Given there is club named Fit Plant in Warsaw city
  Given the following users exist:
  | id | first_name | last_name | email | type   |
  | 0  | John       | Smith     | j@s.c | Keeper |
  | 1  | Mark       | Thompson  | m@t.c | Player |
  Given the following leagues exist:
  | id | name  | sport  | weekday | keeper_id |
  | 0  | lig   | chess  | 2       | 0         |
  Given the following meetings exist:
  | date     | league_id |
  | 5.5.4000 | 0         | 
  | 5.5.2014 | 0         |
  Given I am logged in as Mark Thompson

Scenario: subcribe for a match
  Given I am on the lig league page
  Then I should see "5.5.4000"
  And I should see "5.5.2014"
  And I should not see "Edit"
  




