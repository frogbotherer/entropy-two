describe "Coord object", ->

    beforeEach ->
        Ext.syncRequire "entropy.util.Coord"
        Ext.syncRequire "entropy.util.Vector"

    it "should load Coord helper via syncRequire", ->
        expect(entropy.util.Coord).not.toBe(undefined)

    it "should put 'Coord' in the global namespace", ->
        expect(Coord).not.toBe(undefined)
    
    it "should create valid cartesian coords given x and y values", ->
        a = new Coord(5, 4)
        expect(a.x).toBe(5)
        expect(a.y).toBe(4)

    it "should let a coord + a vector return a new coord with appropriate x and y values", ->
        a = new Coord(3, 1)
        b = new Vector(2, 6)

        r = a.add(b)
        expect(r.x).toBe(5)
        expect(r.y).toBe(7)

        r = a.add(b)
        expect(r.x).toBe(5)
        expect(r.y).toBe(7)

    it "should prevent coords being created outside of a given grid size", ->
        gridSize = new Coord(9, 9) # 9 elements, i.e. 0..8 by 0..8

        expect( -> new Coord(10, 9, gridSize)).toThrow(new Error("Coord(10, 9) out of bounds"))
        expect( -> new Coord(8, 9, gridSize)).toThrow(new Error("Coord(8, 9) out of bounds"))
        expect( -> new Coord(-2, 1, gridSize)).toThrow(new Error("Coord(-2, 1) out of bounds"))

    it "should prevent coords being created outside the grid as a consequence of vector addition", ->
        gridSize = new Coord(9, 9) # 9 elements, i.e. 0..8 by 0..8

        a = new Coord(7, 7, gridSize)
        v = new Vector(1, 8)
        expect(-> a.add(v)).toThrow(new Error("Coord(8, 15) out of bounds"))

    it "should return a useful toString()", ->
        a = new Coord(1, 3)
        expect(a.toString()).toBe("Coord(1, 3)")

    it "should raise an exception if adding a non-vector", ->
        a = new Coord(3, 2)
        expect(-> a.add(1)).toThrow(new Error("Can't add 1 to Coord(3, 2)"))

    it "should let a coord be moved by a vector", ->
        a = new Coord(2, 4)
        v = new Vector(1, -2)
        
        a.move(v)

        expect(a.x).toBe(3)
        expect(a.y).toBe(2)
