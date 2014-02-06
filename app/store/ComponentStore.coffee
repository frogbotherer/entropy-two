Ext.define "entropy.store.ComponentStore",
    extend: "Ext.data.Store"
    config:
        storeId: "entropy.store.ComponentStore"
        model: "entropy.model.Component"
        autoLoad: true
        proxy:
            type: 'ajax'
            url: 'resources/data/Components.json'
            enablePagingParams: false
            reader:
                type: 'json'
                rootProperty: 'components'
