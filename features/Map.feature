Feature: Map overview
  As a beer enthusiast I should be able
  to find good beer locations on an integrated map.

Scenario: Locations present
  Given I'm on the map
  Then I should be able to get details for each location



Scenario: Location details
  Given I'm on the map
  When I go to Chimay
  Then I should see detailed information about Chimay


