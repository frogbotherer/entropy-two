# Represents a space-faring ship, possibly owned by the player
Ext.define "entropy.model.Ship",
    extend: "Ext.data.Model"
    config:
        fields: [
            name: 'name'
            type: 'string'
        ,
            name: 'grid'
            type: 'grid'
        ]
        identifier: 'uuid'
        proxy:
            type: 'localstorage'
            id: 'entropy.model.Ship'
        
