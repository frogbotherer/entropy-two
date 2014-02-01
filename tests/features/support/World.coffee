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
    # TODO: this belongs in an init function for the game somewhere
    @shipStore = Ext.create "Ext.data.Store",
        storeId: "shipStore"
        model: "Ship"

###
# take data from ajax store instead
        data: [
            name: "Shuttle"
            grid: new Grid(new Coord(5, 5), [
                0, 0, 1, 1, 0, 0
                0, 1, 1, 1, 1, 0
                0, 1, 1, 1, 1, 0
                1, 1, 1, 1, 1, 1
                1, 1, 1, 1, 1, 1
                1, 1, 1, 1, 1, 1
                ])
        ,
            name: "Pod"
            grid: new Grid(new Coord(0, 0), [1])
        ]
    
###
