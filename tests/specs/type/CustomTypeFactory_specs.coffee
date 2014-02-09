describe "custom type factory", ->
    beforeEach ->
        Ext.syncRequire "entropy.type.CustomTypeFactory"

    it "should load via syncRequire", ->
        expect(entropy.type.CustomTypeFactory).toBeDefined()
        
    it "should create a GRID type", ->
        grid = entropy.type.CustomTypeFactory.create("entropy.type.GridType")
        expect(grid).toBe(Ext.data.Types.GRID)

    it "should add the GRID type to Ext.data.Types", ->
        grid = entropy.type.CustomTypeFactory.create("entropy.type.GridType")
        expect(Ext.data.Types.GRID).toBeDefined()
        expect(Ext.data.Types.GRID.convert).toBeDefined()
