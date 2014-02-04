describe "Components Store", ->
    async = new AsyncSpec(this)

    async.beforeEach (done) ->
        # get deps into namespace
        Ext.syncRequire "entropy.model.Component"
        Ext.syncRequire "entropy.store.ComponentStore"
        components = new entropy.store.ComponentStore()
        components.on "load", ->
            done()

    beforeEach ->
        @componentStore = Ext.getStore "entropy.store.ComponentStore"

    it "should load via syncRequire", ->
        expect(entropy.store.ComponentStore).toBeDefined()

    it "should create a valid store", ->
        expect(@componentStore).toBeDefined()

    it "should retain a store instance in the manager", ->
        s = Ext.getStore "entropy.store.ComponentStore"
        expect(s).toBeDefined()
        expect(s).toBe(@componentStore)

    it "should fetch a Basic Sub-Light Engine (ID 1) from the cson store", ->
        basicEngine = @componentStore.getById(1)
        expect(basicEngine).not.toBe(null)
        expect(basicEngine.get("name")).toEqual("Basic Sub-Light Engine")
