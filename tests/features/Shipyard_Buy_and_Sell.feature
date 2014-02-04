Feature: Shipyard - Buy and Sell Components
  Player can buy and sell ship components whilst docked at a station. Bought components are available for fitting; sold components are removed from the ship in dock.

  Background:
    Given the player is in the shipyard

  Scenario: List component instances to buy and sell
    Then all the components available to buy from the shipyard are listed
    And all the components available to sell from the ship are listed
    
  Scenario: Select a component for purchase
    Given a component is listed that the player can afford
    When the component is selected for purchase
    Then the component appears as selected
    And the player's balance is updated

  Scenario: Select an unaffordable component for purchase
    Given a component is listed that the player can't afford
    Then the component can't be selected for purchase

  Scenario: Select a component for sale
    Given the player has a component fitted to their ship
    When the component is selected for sale
    Then the component appears as selected
    And the player's balance is updated
