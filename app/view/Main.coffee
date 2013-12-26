Ext.define 'entropy.view.Main',
    extend: 'Ext.tab.Panel'
    xtype: 'main'
    requires: ['Ext.TitleBar', 'Ext.Video']
    config:
        tabBarPosition: 'bottom'
        items: [
            title: 'Welcome'
            iconCls: 'home'
            styleHtmlContent: true
            scrollable: true
            items:
                docked: 'top'
                xtype: 'titlebar'
                title: 'Welcome to Sencha Touch 2'
            html: """woop woop cw woz ere innit woop woop the 
                    contents of <a target='_blank' href=\"app/view/Main.js\">app/view/Main.js</a> - edit that file
                    and refresh to change what's rendered here."""
        , # /item 0
            title: 'Get Started'
            iconCls: 'action'
            items: [
                docked: 'top'
                xtype: 'titlebar'
                title: 'Getting Started'
            , # /item 0
                xtype: 'video'
                url: 'http://av.vimeo.com/64284/137/87347327.mp4?token=1330978144_f9b698fea38cd408d52a2393240c896c'
                posterUrl: 'http://b.vimeocdn.com/ts/261/062/261062119_640.jpg'
            ]
        ]
