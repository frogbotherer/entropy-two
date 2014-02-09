describe "Ship", ->
    async = new AsyncSpec(this)
    
    async.beforeEach (done) ->
        Ext.syncRequire "entropy.model.Ship"
        Ext.syncRequire "entropy.store.ShipStore"
        store = new entropy.store.ShipStore()
        store.on "load", ->
            done()

    it "should load via syncRequire", ->
        expect(entropy.model.Ship).not.toBe(undefined)
        expect(entropy.model.Ship.getProxy).not.toBe(undefined)
        expect(entropy.model.Ship.getProxy()).not.toBe(undefined)

    it "should use a custom data type to represent its grid", ->
        pod = Ext.getStore("entropy.store.ShipStore").getById(2) # pod
        expect(pod).not.toBe(null)
        a = pod.get("grid")
        expect("#{a}").toEqual("Grid(\n1\n)")

    it "should fetch a Shuttle (ID 1) from the cson store", (done) ->
        store = Ext.getStore "entropy.store.ShipStore"
        shuttle = store.getById(1)

        expect(shuttle).not.toBe(undefined)
        expect(shuttle.getId()).toEqual(1)
        expect(shuttle.get("name")).toEqual("Shuttle")
        expect(shuttle.get("grid").size.x).toEqual(5)
        expect(shuttle.get("grid").size.y).toEqual(5)

