module.exports.World = (callback) ->
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

