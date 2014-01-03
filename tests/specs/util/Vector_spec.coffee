describe "Vector object", ->
    beforeEach ->
        Ext.syncRequire "entropy.util.Vector"

    it "should load Vector helper via syncRequire", ->
        expect(entropy.util.Vector).not.toBe(undefined)

    it "should put 'Vector' in the global namespace", ->
        expect(Vector).not.toBe(undefined)

    it "should create valid vectors given integer x and y values", ->
        v = new Vector(1, -1)
        expect(v.dx).toBe(1)
        expect(v.dy).toBe(-1)

    it "should let a vector + a vector return a new vector", ->
        a = new Vector(1, 2)
        b = new Vector(2, -1)

        r = a.add(b)
        expect(r.dx).toBe(3)
        expect(r.dy).toBe(1)

        r = b.add(a)
        expect(r.dx).toBe(3)
        expect(r.dy).toBe(1)

    it "should return a useful toString()", ->
        a = new Vector(1, -3)
        expect(a.toString()).toBe("Vector(1, -3)")

    it "should raise an exception if adding a non-vector", ->
        a = new Vector(3, 2)
        expect(-> a.add(1)).toThrow(new Error("Can't add 1 to Vector(3, 2)"))
