module.exports.World = (callback) ->

    # Spooky headless browser testing
    @BASE_URI = "http://localhost:4400/"
    @spooky = new Spooky(
        casper:
            verbose: true
            logLevel: 'debug'
        child:
            transport: 'http'
    , (err) ->
        if (err)
            e = new Error('Failed to initialize SpookyJS')
            e.details = err
            throw e
    )        

    # basic fixtures for testing
    # TODO: put this in a common test support library
    
    @shipStore = Ext.getStore "entropy.store.Ships"

