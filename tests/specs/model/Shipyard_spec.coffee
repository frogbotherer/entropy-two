describe "Shipyard", ->
    beforeEach ->
        Ext.syncRequire "entropy.model.Shipyard"
        entropy.model.Shipyard.getProxy().clear()

    it "should load via syncRequire", ->
        expect(entropy.model.Shipyard).not.toBe(undefined)

    it "should persist using local storage", ->
        y1 = new entropy.model.Shipyard
            name: 'Test Shipyard'
            level: 5

        y1.save
            success: (y1) ->
                expect(y1.getId()).not.toBe(undefined)

        entropy.model.Shipyard.load y1.getId(),
            success: (y2) ->
                expect(y2.getId()).toBe(y1.getId())
                expect(y2.get('name')).toBe('Test Shipyard')
                expect(y2.get('level')).toBe(5)

            
