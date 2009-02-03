Feature: In order to sell items
  As an user
  I want to create and manage items
 
Scenario: Able to see the new item page
  When I navigate to the home page
  And I follow "new_item"
  Then the new "items" page should be displayed
  
Scenario: Create an item without the correct information
  Given I am in the new "items" page
  When I press "Create Item"
  Then I should see "Name can't be blank"
  And I should see "Description can't be blank"
  
Scenario: Create an item
  Given I am in the new "items" page
  When I enter {'item[name]' => 'my item', 'item[description]' => 'my description', 'item[price]' => '1.5'}
  When I press "Create Item"
  Then the "items" page should be displayed
  And I should see "Item successfully created"
  
Scenario: Items are correctly displayed in the home page
  Given a "item" exists with {'name' => 'my item', 'description' => 'my description', 'price' => '1.5'}
  And a "item" exists with {'name' => 'my second item', 'description' => 'my second description', 'price' => '3.0'}
  When I navigate to the home page
  Then the "items-list" should look like
  | Name            | Description           | Price |
  | my item         | my description        | 1.5 |
  | my second item  | my second description | 3.0 |