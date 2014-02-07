describe "ComponentInstance Store", ->
    async = new AsyncSpec(this)

    async.beforeEach (done) ->
        # get deps into namespace
        Ext.syncRequire "entropy.model.ComponentInstance"
        Ext.syncRequire "entropy.store.ComponentInstanceStore"
        instances = new entropy.store.ComponentInstanceStore()
        instances.on "load", ->
            done()
        instances.load()  # because autoSync = false

    beforeEach ->
        @instanceStore = Ext.getStore "entropy.store.ComponentInstanceStore"

    it "should load via syncRequire", ->
        expect(entropy.store.ComponentInstanceStore).toBeDefined()

    it "should create a valid store", ->
        expect(@instanceStore).toBeDefined()

    it "should retain a store instance in the manager", ->
        s = Ext.getStore "entropy.store.ComponentInstanceStore"
        expect(s).toBeDefined()
        expect(s).toBe(@instanceStore)

    it "should persist using local storage", ->
        # TODO
        #ci = new entropy.model.ComponentInstance
        #    techLevel: 5
            

    it "allows addition of new random instances to the store", ->
        # TODO
