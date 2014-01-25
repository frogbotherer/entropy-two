describe "ComponentInstance", ->
    beforeEach ->
        Ext.syncRequire "entropy.model.ComponentInstance"

    it "should load via syncRequire", ->
        expect(entropy.model.ComponentInstance).not.toBe(undefined)
