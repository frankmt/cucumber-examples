Feature: In order to sell items
  As an user
  I want to create and manage items

Scenario: Able to see the new item page
	When I navigate to the home page
  And I follow "New Item"
  Then the new "items" page should be displayed