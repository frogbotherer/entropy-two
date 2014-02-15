Ext.define 'entropy.view.shipyard.Main',
    extend: 'Ext.Container'
    constructor: (@stationView) ->
        @callParent()
    config:
        fullscreen: true
        title: "[shipyard name] [tech level hint]"
        items: [
            scrollable: true
            items:
                xtype: 'panel'
                html: '<b>[shipyard info]</b>'
            ,
                xtype: 'button'
                text: 'Buy and Sell Components'
                handler: ->
                    @up().stationView.push
                        title: 'buy n sell stuff'
            ,
                xtype: 'button'
                text: 'Buy and Sell Ships'
            ,
                xtype: 'button'
                text: 'Refuel'
            ,
                xtype: 'button'
                text: 'Repairs'
        ]
