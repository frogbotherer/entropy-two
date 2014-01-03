Ext.define "entropy.util.Coord",
    alternateClassName: "Coord"
    require: ["entropy.util.Vector"]

    constructor: (@x, @y, @gridSize=null) ->
        # bounds check gridSize if set
        if @gridSize? and not (0 <= @x < @gridSize.x and 0 <= @y < @gridSize.y)
            throw Error("Coord(#{@x}, #{@y}) out of bounds")

    toString: ->
        "Coord(#{@x}, #{@y})"
    
    add: (v) ->
        # sanity
        throw Error("Can't add #{v} to #{this}") if not (v instanceof Vector)
        
        return new Coord(@x + v.dx, @y + v.dy, @gridSize)
