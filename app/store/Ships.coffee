Ext.define "entropy.store.Ships",
    extend: "Ext.data.Store"
    require: "entropy.model.Ship"
    config:
        storeId: "entropy.store.Ships"
        model: "entropy.model.Ship"
        autoLoad: true
        proxy:
            type: 'ajax'
            url: 'resources/data/Ships.json'
            enablePagingParams: false
            reader:
                type: 'json'
                rootProperty: 'ships'
