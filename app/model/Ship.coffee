Ext.apply Ext.data.Types,
    GRID:
        convert: (v, rec) ->
            Ext.syncRequire "entropy.util.Grid"
            Ext.syncRequire "entropy.util.Coord"
            new entropy.util.Grid(new entropy.util.Coord(v.size.x, v.size.y), v.layout)
        sortType: (v) ->
            1  # no obvious way to sort a set of grid objects
        type: 'grid'

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
            type: 'string' #Ext.data.Types.GRID
        ]
        idProperty: 'id'
