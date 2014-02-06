Ext.define "entropy.store.ComponentInstanceStore",
    extend: "Ext.data.Store"
    config:
        storeId: "entropy.store.ComponentInstanceStore"
        model: "entropy.model.ComponentInstance"
        proxy:
            type: 'localstorage'
            id: 'entropy.model.ComponentInstance'
