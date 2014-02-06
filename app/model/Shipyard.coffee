# Represents a shipyard in a station.
Ext.define "entropy.model.Shipyard",
    extend: "Ext.data.Model"
    requires: ["entropy.model.ComponentInstance"]
    config:
        fields: [
            name: 'name'
            type: 'string'
        ,
            name: 'level'
            type: 'int'
        ]
        identifier: 'uuid'
        proxy:
            type: 'localstorage'
            id: 'entropy.model.Shipyard'
        hasMany:
            model: 'entropy.model.ComponentInstance'
            name: 'componentInstances'

    ##
    # methods

    # generateStock
    # Generate representative stock for the shipyard
    #generateStock: ->
    #    @componentInstances().add
    #        entropy.model.ComponentInstance.random(@level)
