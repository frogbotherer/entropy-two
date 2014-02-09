Ext.define "entropy.store.ShipInstanceStore",
    extend: "Ext.data.Store"
    config:
        storeId: "entropy.store.ShipInstanceStore"
        model: "entropy.model.ShipInstance"
        proxy:
            type: 'localstorage'
            id: 'entropy.model.ShipInstance'
