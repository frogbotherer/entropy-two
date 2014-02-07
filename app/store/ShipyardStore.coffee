Ext.define "entropy.store.ShipyardStore",
    extend: "Ext.data.Store"
    config:
        storeId: "entropy.store.ShipyardStore"
        model: "entropy.model.Shipyard"
        proxy:
            type: 'localstorage'
            id: 'entropy.model.Shipyard'
