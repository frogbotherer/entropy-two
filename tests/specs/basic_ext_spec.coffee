describe "During initialization and setup, the application...", ->
 
    it "should load Sencha 2.3", ->
        expect( Ext ).toBeDefined()
        expect( Ext.getVersion() ).toBeTruthy()
        expect( Ext.getVersion().major ).toEqual( 2 )
        expect( Ext.getVersion().minor ).toEqual( 3 )

describe "Test Main.js view", ->
    beforeEach ->
        Ext.syncRequire "entropy.view.Main"
        
    it "should load via syncRequire", ->
        expect(entropy.view.Main).not.toBe(undefined)
 
 
 
