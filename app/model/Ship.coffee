# Represents a kind of space-faring ship
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
            type: 'ajax'
            url: 'resources/data/Ships.json'
            reader:
                type: 'json'
                rootProperty: 'ships'
        
