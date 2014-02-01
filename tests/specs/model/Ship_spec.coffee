describe "Ship", ->
    beforeEach ->
        Ext.syncRequire "entropy.model.Ship"

    it "should load via syncRequire", ->
        expect(entropy.model.Ship).not.toBe(undefined)

    it "should fetch a Shuttle (ID 1) from the cson store", ->
        entropy.model.Ship.load 1,
            success: (shuttle) ->
                expect(shuttle).not.toBe(undefined)
                expect(shuttle.getId()).toEqual(1)
                expect(shuttle.get("name")).toEqual("Shuttle")
            failure: (shuttle) ->
                fail()
