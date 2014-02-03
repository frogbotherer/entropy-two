# dependencies
Ext.syncRequire "entropy.util.Coord"
Ext.syncRequire "entropy.util.Grid"

# grid data type
Ext.apply Ext.data.Types,
    GRID:
        convert: (v, rec) ->
            new entropy.util.Grid(new entropy.util.Coord(v.size.x, v.size.y), v.layout)
        sortType: (v) ->
            1  # no obvious way to sort a set of grid objects
        type: 'grid'
