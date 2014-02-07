# Represents a shipyard in a station.
Ext.define "entropy.model.Shipyard",
    extend: "Ext.data.Model"
    requires: ["entropy.model.ComponentInstance"]
    config:
        fields: [
            name: 'name'
            type: 'string'
        ,
            name: 'techLevel'
            type: 'int'
        ]
        identifier: 'uuid'
        hasMany:
            model: 'entropy.model.ComponentInstance'
            name: 'componentInstances'

    ##
    # methods

    # generateStock
    # Generate representative stock for the shipyard
    #generateStock: ->
    #    @componentInstances().addRandom(@techLevel)
