Ext.define "entropy.store.ShipStore",
    extend: "Ext.data.Store"
    require: "entropy.model.Ship"
    config:
        storeId: "entropy.store.ShipStore"
        model: "entropy.model.Ship"
        autoLoad: true
        proxy:
            type: 'ajax'
            url: 'resources/data/Ships.json'
            enablePagingParams: false
            reader:
                type: 'json'
                rootProperty: 'ships'
