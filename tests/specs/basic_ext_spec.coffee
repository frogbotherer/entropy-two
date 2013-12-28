describe "During initialization and setup, the application...", ->
 
    it "should load Sencha 2.3", ->
        expect( Ext ).toBeDefined()
        expect( Ext.getVersion() ).toBeTruthy()
        expect( Ext.getVersion().major ).toEqual( 2 )
        expect( Ext.getVersion().minor ).toEqual( 3 )
 
 
 
