describe "grid type", ->
    beforeEach ->
        Ext.syncRequire "entropy.util.Grid"
        Ext.syncRequire "entropy.type.CustomTypeFactory"
        entropy.type.CustomTypeFactory.create("entropy.type.GridType", "GRID")

    it "should add GRID to the standard set of data types", ->
        expect(Ext.data.Types.GRID).toBeDefined()

    it "should convert suitable AJAX into a Grid object", ->
        ajax = size:
            x: 3
            y: 1
        layout: [
            0, 0, 1, 1
            1, 0, 1, 0
            ]
        g = Ext.data.Types.GRID.convert(ajax)
        expect(g).toBeDefined()
        expect(g instanceof entropy.util.Grid).toBe(true)
