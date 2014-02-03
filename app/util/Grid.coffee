# An unevenly-shaped grid of tiles
Ext.define "entropy.util.Grid",
    alternateClassName: "Grid"
    requires: ["entropy.util.Coord"]

    # An unevenly-shaped grid of tiles
    # @param {Coord} Size of the bounding grid (zero-indexed)
    # @param {int[]} Array of ints representing tiles. 0 for empty
    constructor: (@size, @layout=null) ->
        # if layout isn't supplied, create an empty one
        if not @layout?
            @layout = Array.apply(null, Array((@size.x + 1) * (@size.y + 1))).map((i) -> 0)
        
        # validate that layout matches gridsize
        throw Error("Grid layout doesn't match supplied size") if @layout.length != (@size.x + 1) * (@size.y + 1)

        # validate content of layout
        throw Error("Grid layout contains invalid data") if @layout.reduce(((a, b) -> a or (b < 0) or (b > 1)), false)


    # Shows layout
    toString: ->
        out = ((if (i+1) % (@size.x+1) == 0 then "#{s}\n" else "#{s}") for s, i in @layout).join('').replace(/0/g,' ')
        "Grid(\n#{out})"

