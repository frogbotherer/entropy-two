describe "Game model", ->
    beforeEach ->
        Ext.syncRequire "entropy.model.Game"
        Ext.syncRequire "entropy.view.Main"
        
    it "should load via syncRequire", ->
        alert "cw woz ere #{entropy.model}"
        expect(entropy.model.Game).not.toBe(undefined)
 
 
