Feature: viewing content when unlogged
  As a unlogged user
  So that I can see site content
  I want to be able to navigate through the site

Background: leagues in database
  Given the following leagues exist:
  | name  | sport  | weekday |
  | L1    | tenis  | 1       |

Scenario: viewing league list
  Given the following leagues exist:
  | name  | sport  | weekday |
  | lig   | chess  | 2       |
  | Champ | squash | 3       |
  And I am on the home page
  And I follow "Leagues"
  Then I should be on the leagues page
  And I should see "L1"
  And I should see "lig"
  And I should see "Champ"
  And I should see "chess"
  And I should see "Monday"

Scenario: viewing league details
  Given I am on the leagues page
  And I follow "Details..."
  Then I should be on the L1 league page
  And I should see "L1"
  
