describe "ShipInstance Store", ->
    async = new AsyncSpec(this)

    async.beforeEach (done) ->
        # get deps into namespace
        Ext.syncRequire "entropy.model.ShipInstance"
        Ext.syncRequire "entropy.store.ShipInstanceStore"
        instances = new entropy.store.ShipInstanceStore()
        instances.on "load", ->
            done()
        instances.load()  # because autoSync = false

    beforeEach ->
        @instanceStore = Ext.getStore "entropy.store.ShipInstanceStore"

    it "should load via syncRequire", ->
        expect(entropy.store.ShipInstanceStore).toBeDefined()

    it "should create a valid store", ->
        expect(@instanceStore).toBeDefined()

    it "should retain a store instance in the manager", ->
        s = Ext.getStore "entropy.store.ShipInstanceStore"
        expect(s).toBeDefined()
        expect(s).toBe(@instanceStore)

    it "should persist using local storage", ->
        si1 = new entropy.model.ShipInstance
            name: "SS Test Ship"
        @instanceStore.add(si1)
        @instanceStore.sync()

        si2 = @instanceStore.getById(si1.getId())
        expect(si2).toBeDefined()
        expect(si2.get("name")).toEqual("SS Test Ship")

    xit "allows addition of new random instances to the store", ->
        # TODO
