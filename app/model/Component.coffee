# dependencies
Ext.syncRequire "entropy.type.GridType"

# Represents a type of component for a ship (e.g. an engine)
Ext.define "entropy.model.Component",
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
        ,
            name: 'basePrice'
            type: 'int'
        ]
        idProperty: 'id'
        belongsTo: 'entropy.model.ComponentInstance'
