describe "ShipInstance", ->
    beforeEach ->
        Ext.syncRequire "entropy.model.ShipInstance"

    it "should load via syncRequire", ->
        expect(entropy.model.ShipInstance).not.toBe(undefined)
