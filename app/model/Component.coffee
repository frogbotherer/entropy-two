# Represents a type of component for a ship (e.g. an engine)
Ext.define "entropy.model.Component",
    extend: "Ext.data.Model"
    config:
        fields: [
            name: 'name'
            type: 'string'
        ]
        identifier: 'uuid'
        proxy:
            type: 'localstorage'
            id: 'entropy.model.Component'
        belongsTo: 'entropy.model.ComponentInstance'
