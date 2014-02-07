describe "Shipyard", ->
    beforeEach ->
        Ext.syncRequire "entropy.model.Shipyard"

    it "should load via syncRequire", ->
        expect(entropy.model.Shipyard).not.toBe(undefined)


            
