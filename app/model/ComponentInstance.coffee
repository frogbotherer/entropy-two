# Represents a component of a ship (e.g. basic engine +1 fuel cons.)
Ext.define "entropy.model.ComponentInstance",
    extend: "Ext.data.Model"
    config:
        fields: [
        ]
        identifier: 'uuid'
        proxy:
            type: 'localstorage'
            id: 'entropy.model.ComponentInstance'
        hasOne: "entropy.model.Component"
        belongsTo: [
            "entropy.model.Shipyard"
        ]
        
