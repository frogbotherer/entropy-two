# Represents a shipyard in a station.
Ext.define "entropy.model.Shipyard",
    extend: "Ext.data.Model"
    config:
        fields: [
            name: 'name'
            type: 'string'
        ,
            name: 'level'
            type: 'int'
        ]
        identifier: 'uuid'
        proxy:
            type: 'localstorage'
            id: 'entropy.model.Shipyard'
        hasMany: 'entropy.model.ComponentInstance'
