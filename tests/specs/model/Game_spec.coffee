describe "Game model", ->
    beforeEach ->
        Ext.syncRequire "entropy.model.Game"
        
    it "should load via syncRequire", ->
        expect(entropy.model.Game).not.toBe(undefined)
 
###
    # construction methods
    it "should set a grid size using a coordinate object"
    it "should set a tile colour at a given coordinate using a tile object"
    it "should set the full grid of tiles given an array of ints"
    it "should set the winning move(s) using a list of vector objects"

    # hashing
    it "should populate a grid structure based on a hash value"
    it "should populate the same grid structure for the same hash"
    it "should generate a suitable hash and grid structure given a particular target difficulty"

    # timer
    it "should set a time remaining as a count down object"
    it "should trigger a game over event if its count down reaches zero"

### 
