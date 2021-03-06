describe "Grid object", ->

    async = new AsyncSpec(this)

    async.beforeEach (done) ->
        # require dependent helper classes
        Ext.syncRequire "entropy.util.Grid"
        Ext.syncRequire "entropy.util.Coord"

        # so that the ships store is available
        Ext.syncRequire "entropy.model.Ship"
        Ext.syncRequire "entropy.store.ShipStore"
        ships = new entropy.store.ShipStore()
        ships.on "load", ->
            # on load, call done()
            done()

    it "should load Grid helper via syncRequire", ->
        expect(entropy.util.Grid).not.toBe(undefined)

    it "should put 'Grid' in the global namespace", ->
        expect(Grid).not.toBe(undefined)

    it "should create an empty Grid of the given size", ->
        a = new Grid(new Coord(1, 2))
        expect(a.layout.length).toBe(6)
        for i in a.layout
            expect(i).toBe(0)

    it "should create a filled grid if a layout is specified", ->
        testLayout = [
            0, 1, 1, 0,
            1, 1, 1, 1,
            ]
        a = new Grid(new Coord(3, 1), testLayout)
        expect(a.layout).toBe(testLayout)

    it "should throw an error if the grid size doesn't match the layout given", ->
        expect( -> new Grid(new Coord(1, 1), [0, 0])).toThrow(new Error("Grid layout doesn't match supplied size"))

    it "should throw an error if the layout contains invalid data", ->
        expect( -> new Grid(new Coord(1, 1), [0, 1, 0, 3])).toThrow(new Error("Grid layout contains invalid data"))

    it "should print a useful string representation", ->
        testLayout = [
            1, 0, 1,
            0, 1, 0
            ]
        a = new Grid(new Coord(2, 1), testLayout)
        expect("#{a}").toEqual("Grid(\n1 1\n 1 \n)")

    it "should act as an Ext data type", ->
        pod = Ext.getStore("entropy.store.ShipStore").getById(2) # pod
        expect(pod).not.toBe(null)
        a = pod.get("grid")
        expect("#{a}").toEqual("Grid(\n1\n)")

