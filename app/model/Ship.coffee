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
            type: 'grid'
        ]
        proxy:
            type: 'ajax'
            url: 'resources/data/Ships.json'
            enablePagingParams: false
            reader:
                type: 'json'
                rootProperty: 'ships'
        
