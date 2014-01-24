Feature: Shipyard Game
  Player can add to (and remove from) the structure of a ship that they have in dock at this station.
  Adding components costs money for parts and labour; removing them costs money for parts and returns cash for resale/scrap.
  A small fee is charged whilst the ship is in the shipyard.
  The ship is presented as a grid, and components as pieces that fit in the grid.
  Challenge comes from fitting all the desired components into the grid, whilst minimising labour costs and improving the ship's capabilities.

  Background:
    Given the player has a Shuttle ship
    And the ship has no components

  Scenario: Draw a shuttle grid
    When the shipyard game starts
    Then the ship's grid is drawn
    And no components are drawn on the grid
  
  Scenario: Add an engine
    Given an Engine component is in the shipyard
    When the shipyard game starts
    And the Engine component is dragged onto the grid
    Then the Shuttle has an Engine component
