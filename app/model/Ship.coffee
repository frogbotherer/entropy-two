# dependencies
Ext.syncRequire "entropy.type.GridType"

# Represents a kind of space-faring ship
Ext.define "entropy.model.Ship",
    extend: "Ext.data.Model"
    config:
        fields: [
            name: 'id'
            type: 'int'
        ,
            name: 'name'
            type: 'string'
        ,
            name: 'grid'
            type: Ext.data.Types.GRID
        ]
        idProperty: 'id'
