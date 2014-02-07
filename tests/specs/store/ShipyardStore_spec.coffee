describe "Shipyard Store", ->
    async = new AsyncSpec(this)

    async.beforeEach (done) ->
        # get deps into namespace
        Ext.syncRequire "entropy.model.Shipyard"
        Ext.syncRequire "entropy.store.ShipyardStore"
        instances = new entropy.store.ShipyardStore()
        instances.on "load", ->
            done()
        instances.load()  # because autoSync = false

    beforeEach ->
        @shipyardStore = Ext.getStore "entropy.store.ShipyardStore"

    it "should load via syncRequire", ->
        expect(entropy.store.ShipyardStore).toBeDefined()

    it "should create a valid store", ->
        expect(@shipyardStore).toBeDefined()

    it "should retain a store instance in the manager", ->
        s = Ext.getStore "entropy.store.ShipyardStore"
        expect(s).toBeDefined()
        expect(s).toBe(@shipyardStore)

    it "should persist using local storage", ->
        y1 = new entropy.model.Shipyard
            name: 'Test Shipyard'
            techLevel: 5

        @shipyardStore.add y1

        y2 = @shipyardStore.getById y1.getId()

        expect(y2).toBeDefined()
        expect(y2.getId()).toBe(y1.getId())
        expect(y2.get('name')).toBe('Test Shipyard')
        expect(y2.get('techLevel')).toBe(5)

    it "allows addition of new random instances to the store", ->
        # TODO
