# An unevenly-shaped grid of tiles
Ext.define "entropy.util.Grid",
    alternateClassName: "Grid"
    require: ["entropy.util.Coord"]

    # An unevenly-shaped grid of tiles
    # @param {Coord} Size of the bounding grid (zero-indexed)
    # @param {int[]} Array of ints representing tiles. 0 for empty
    constructor: (@gridSize, @layout=null) ->
        # if layout isn't supplied, create an empty one
        if not @layout?
            @layout = Array.apply(null, Array((@gridSize.x + 1) * (@gridSize.y + 1))).map((i) -> 0)
        
        # validate that layout matches gridsize
        throw Error("Grid layout doesn't match supplied size") if @layout.length != (@gridSize.x + 1) * (@gridSize.y + 1)

        # validate content of layout
        throw Error("Grid layout contains invalid data") if @layout.reduce(((a, b) -> a or (b < 0) or (b > 1)), false)


    # Shows layout
    toString: ->
        out = ((if (i+1) % (@gridSize.x+1) == 0 then "#{s}\n" else "#{s}") for s, i in @layout).join('').replace(/0/g,' ')
        "Grid(\n#{out})"

# map grid to an Ext type
Ext.apply Ext.data.Types,
    GRID:
        convert: (v, data) ->
            new entropy.util.Grid(data.gridSize, data.layout)
        sortType: (v) ->
            v.gridSize.x  # a bit arbitrary
        type: 'grid'
