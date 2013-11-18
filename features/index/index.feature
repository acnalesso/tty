Feature: Home Page
  In order to go interact with this awesome website
  As a user
  I want to see the home page

Scenario:
  Given I am an unregisted user
  When I go to "/" page
  Then I should see a logo
  And I should see a menu
  And I should see a search text
  And I should see some Activities
  And I should see intro text
  And I should see sign up box
  And I should see a footer
