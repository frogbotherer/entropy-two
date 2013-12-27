describe "During initialization and setup, the application...", ->
 
    it "should load ExtJS 4", ->
        expect( Ext ).toBeDefined()
        expect( Ext.getVersion() ).toBeTruthy()
        expect( Ext.getVersion().major ).toEqual( 4 )
 
 
    it "should set the Application name", ->
        expect( window.Application ).toBeDefined()
        expect( window.Application.name ).toEqual( "Entropy" )
 
