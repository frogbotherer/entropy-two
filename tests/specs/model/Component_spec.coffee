describe "Component", ->
    beforeEach ->
        Ext.syncRequire "entropy.model.Component"

    it "should load via syncRequire", ->
        expect(entropy.model.Component).not.toBe(undefined)
