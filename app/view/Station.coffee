Ext.define 'entropy.view.Station',
    extend: 'Ext.tab.Panel'
    xtype: 'main'
    requires: ['Ext.TitleBar']
    config:
        tabBarPosition: 'bottom'
        items: [
            title: 'Station'
            iconCls: 'home'
            styleHtmlContent: true
            scrollable: true
            items:
                docked: 'top'
                xtype: 'titlebar'
                title: 'Welcome to foobar Station in the boobaz System'
            html: """
                (some vital statistics will go here)
            """
        , # /item 0
            title: 'Shipyard'
            iconCls: 'action'
            items: [
                docked: 'top'
                xtype: 'titlebar'
                title: 'Shipyard foobar'
            ,
                docked: 'left'
                xtype: 'entropy.shipyard.componentinstance.list'
            ,
                docked: 'right'
                xtype: 'entropy.shipyard.ship.grid'
            ]
        ]
        
