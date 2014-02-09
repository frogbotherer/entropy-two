# dependencies
Ext.syncRequire "entropy.type.CustomTypeFactory"

# Represents a kind of space-faring ship
Ext.define "entropy.model.Ship",
    extend: "Ext.data.Model"
    requires: ["entropy.type.CustomTypeFactory"]
    config:
        fields: [
            name: 'id'
            type: 'int'
        ,
            name: 'name'
            type: 'string'
        ,
            name: 'grid'
            type: entropy.type.CustomTypeFactory.create("entropy.type.GridType", "GRID")
        ,
            name: 'basePrice'
            type: 'int'
        ]
        idProperty: 'id'
