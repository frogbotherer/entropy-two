describe "Grid object", ->
    beforeEach ->
        Ext.syncRequire "entropy.util.Grid"
        Ext.syncRequire "entropy.util.Coord"

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
        expect("#{a}").toBe("Grid(\n1 1\n 1 \n)")

    it "should act as an Ext data type", ->
        Ext.syncRequire("entropy.model.Ship")
        a = new Grid(new Coord(2, 1), [0,1,0,1,1,1])
        s = new entropy.model.Ship
            name: "Test Ship"
            grid: a
        s.save
            success: (s) ->
                expect(s.getId()).not.toBe(undefined)
