describe "Ship", ->
    beforeEach ->
        Ext.syncRequire "entropy.model.Ship"

    it "should load via syncRequire", ->
        expect(entropy.model.Ship).not.toBe(undefined)
        expect(entropy.model.Ship.getProxy).not.toBe(undefined)
        expect(entropy.model.Ship.getProxy()).not.toBe(undefined)



    xit "should fetch a Shuttle (ID 1) from the cson store", ->
        done = false
        runs entropy.model.Ship.load
        waitsFor () ->
            done

        entropy.model.Ship.load 1,
            success: (shuttle) ->
                expect(shuttle).not.toBe(undefined)
                expect(shuttle.getId()).toEqual(1)
                expect(shuttle.get("name")).toEqual("Shuttle")
                expect(shuttle.get("grid").size.x).toEqual(5)
                expect(shuttle.get("grid").size.y).toEqual(5)

            failure: (shuttle) ->
                # fail the test
                expect(true).toBe(false)

            callback: (shuttle) ->
                done = true
