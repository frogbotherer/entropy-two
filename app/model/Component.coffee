# dependencies
Ext.syncRequire "entropy.type.CustomTypeFactory"

# Represents a type of component for a ship (e.g. an engine)
Ext.define "entropy.model.Component",
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
        ,
            name: 'techLevel'
            type: 'int'
        ]
        idProperty: 'id'
        belongsTo: 'entropy.model.ComponentInstance'
