describe "Ships Store", ->

    async = new AsyncSpec(this)
    
    async.beforeEach (done) ->
        # get dependencies into namespace
        Ext.syncRequire "entropy.model.Ship"
        Ext.syncRequire "entropy.store.Ships"
        ships = new entropy.store.Ships()
        ships.on "load", ->
            done()

    beforeEach ->
        @shipStore = Ext.getStore "entropy.store.Ships"

    it "should load via syncRequire", ->
        expect(entropy.store.Ships).toBeDefined()

    it "should create a valid store", ->
        expect(@shipStore).toBeDefined()

    it "should retain a store instance in the manager", ->
        # not sure how useful this test is (!)
        s = Ext.getStore "entropy.store.Ships"
        expect(s).toBeDefined()
        expect(s).toBe(@shipStore)

    it "should fetch a Shuttle (ID 1) from the cson store", ->
        shuttle = @shipStore.getById(1)
        expect(shuttle).not.toBe(null)
        expect(shuttle.get("name")).toEqual("Shuttle")
