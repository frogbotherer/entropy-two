Ext.define 'entropy.view.Station',
    extend: 'Ext.navigation.View'
    requires: [
        'Ext.Button',
        'Ext.Panel',
        'entropy.view.shipyard.Main',
    ]
    config:
        fullscreen: true,
        items: [
            title: 'Station [station name] in System [system name]',
            items: [
                xtype: 'panel'
                html: '<b>[station info]</b>'
            ,
                xtype: 'button'
                text: '[Shipyard] [shipyard name]'
                handler: ->
                    stationView = @up().up()
                    stationView.push(
                        Ext.create("entropy.view.shipyard.Main", stationView))
            ,
                xtype: 'button'
                text: '[Exchange] [exchange name]'
            ,
                xtype: 'button'
                text: '[Recruitment] [bar|cantina|etc]'
            ]
        ]
