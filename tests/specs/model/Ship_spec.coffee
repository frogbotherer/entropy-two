describe "Ship", ->
    beforeEach ->
        Ext.syncRequire "entropy.model.Ship"

    it "should load via syncRequire", ->
        expect(entropy.model.Component).not.toBe(undefined)
