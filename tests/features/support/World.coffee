module.exports.World = (callback) ->
    # fish out Spooky from wherever it was installed
    Spooky = require "../../../node_modules/spooky/lib/spooky.js"

    # Spooky headless browser testing
    @BASE_URI = "http://localhost:4400/"
    @spooky = new Spooky
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

    # tell cucumber we're ready
    callback()
