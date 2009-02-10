Feature: In order to sell items
  As an user
  I want to create and manage items

Scenario: Delete an item
  Given an item exists with {'name' => 'my item', 'description' => 'my description', 'price' => '1.5'}
  When I navigate to the home page
  And I press "remove_item" and confirm my option
  Then the "items-list" should look like
  | Name | Description | Price |

Scenario: Delete an item but cancel on confirmation
  Given an item exists with {'name' => 'my item', 'description' => 'my description', 'price' => '1.5'}
  When I navigate to the home page
  And I press "remove_item" and do not confirm my option
  Then the "items-list" should look like
  | Name | Description | Price |
  | my item | my description | 1.5 |
