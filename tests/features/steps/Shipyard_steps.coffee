module.exports = ->
    @Given /the player has a (.*) ship/, (ship, callback) ->
        s = @shipStore.queryBy (record,id) ->
            record.get('name') == ship
        @playerShip = s.first()
        callback()

    @Given /an? (.*) component is in the shipyard/, (component, callback) ->
        callback.pending()

    @Given /the ship has no components/, (callback) ->
        @playerShip.components().removeAll()
        callback()

    @Given /the ship has a (.*) component/, (component, callback) ->
        callback.pending()

    @When /the shipyard game starts/, (callback) ->
        callback.pending()

    @When /the (.*) component is dragged onto the grid/, (component, callback) ->
        callback.pending()

    @Then /the ship.s grid is drawn/, (callback) ->
        callback.pending()

    @Then /the (.*) has an? (.*) component/, (ship, component, callback) ->
        callback.pending()

    @Then /no components are drawn on the grid/, (callback) ->
        callback.pending()

    @Then /an? (.*) component is drawn on the grid/, (component, callback) ->
        callback.pending()


