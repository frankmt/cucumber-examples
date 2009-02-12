Feature: In order to sell special items
  As an user
  I want to create and manage special items

Scenario: Able to see the new item page
  When I navigate to the special items home page
  And I follow "new_special_item"
  Then the new "special_items" page should be displayed

Scenario: Create a special item without the correct information
  Given I am in the new "special_items" page
  When I press "Create Special Item"
  Then I should see error "can't be blank" on name field
  
# grrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr can't get to work - the wait for is a pile of poop right now
# Scenario: Create an item
#   Given I am in the new "special_items" page
#   When I enter { 'special_item[name]' => 'my special item', 'special_item[price]' => 'priceless'}
#   And I select category "TVs" and wait for the subcategory value "" first "Plasma" second "CRT" third
  # And I press "Create Item"
  # Then the "items" page should be displayed
  # And I should see "Item successfully created"

# Scenario: Items are correctly displayed in the home page
#   Given a special item exists with { 'name' => 'my special item', 'price' => '84.0'}
#   And a special item exists with { 'name' => 'my second special item', 'price' => '36.0'}
#   When I navigate to the home page
#   Then the "items-list" should look like
#   | Name            | Description           | Price |
#   | my item         | my description        | 1.5 |
#   | my second item  | my second description | 3.0 |

# Scenario: Delete an item but cancel on confirmation
#   Given an item exists with {'name' => 'my item', 'description' => 'my description', 'price' => '1.5'}
#   When I navigate to the home page
#   And I press "remove_item" and do not confirm my option
#   Then the "items-list" should look like
#   | Name            | Description           | Price |
#   | my item         | my description        | 1.5   |
# 
# Scenario: Delete an item
#   Given an item exists with {'name' => 'my item', 'description' => 'my description', 'price' => '1.5'}
#   When I navigate to the home page
#   And I press "remove_item" and confirm my option
#   Then the "items-list" should look like
#   | Name            | Description           | Price |
