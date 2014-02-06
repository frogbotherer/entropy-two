module.exports = ->
    @Given /the player is in the shipyard/, (callback) ->
        # create a bunch of ComponentInstances
        callback.pending()

    @Then /all the components available to buy from the shipyard are listed/, (callback) ->
        # check all the ComponentInstances that we made are presented
        callback.pending()

    @Then /all the components available to sell from the ship are listed/, (callback) ->
        callback.pending()
