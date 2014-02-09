# Represents a particular space-faring ship, possibly owned by the player
Ext.define "entropy.model.ShipInstance",
    extend: "Ext.data.Model"
    config:
        fields: [
            name: 'name'
            type: 'string'
        ]
        identifier: 'uuid'
        hasOne: 'entropy.model.Ship'
        hasMany: 'entropy.model.ComponentInstance'
