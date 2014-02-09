describe "Component", ->
    async = new AsyncSpec(this)
    
    async.beforeEach (done) ->
        Ext.syncRequire "entropy.model.Component"
        Ext.syncRequire "entropy.store.ComponentStore"
        store = new entropy.store.ComponentStore()
        store.on "load", ->
            done()

    it "should load via syncRequire", ->
        expect(entropy.model.Component).not.toBe(undefined)

    it "should use a custom data type to represent its grid", ->
        engine = Ext.getStore("entropy.store.ComponentStore").getById(1) # engine
        expect(engine).not.toBe(null)
        a = engine.get("grid")
        expect("#{a}").toEqual("Grid(\n11\n11\n11\n)")
