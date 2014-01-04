Ext.define "entropy.util.Coord",
    alternateClassName: "Coord"
    require: ["entropy.util.Vector"]

    # Represents cartesian coordinates on a grid
    # @param {int} X coordinate
    # @param {int} Y coordinate
    # @gridSize {Coord} Size of the grid (zero-indexed)
    # @throws {Error} If x, y outside of gridSize
    constructor: (@x, @y, @gridSize=null) ->
        # bounds check gridSize if set
        @__check_bounds()

    # Useful string representation of Coord object
    # @return {String} "Coord(x, y)"
    # @method
    toString: ->
        "Coord(#{@x}, #{@y})"

    # Adds a vector to this Coord and returns a new one
    # @param {Vector} Vector to add
    # @return {Coord} New Coord object
    # @throws {Error} If not a vector
    # @method
    add: (v) ->
        # sanity
        throw Error("Can't add #{v} to #{this}") if not (v instanceof Vector)
        
        return new Coord(@x + v.dx, @y + v.dy, @gridSize)

    # Moves a coord by a vector
    # @param {Vector} Vector to add
    # @return {Coord} Modified coord object
    # @throws {Error} If not a vector or if this + v
    # @method
    move: (v) ->
        # sanity
        throw Error("Can't add #{v} to #{this}") if not (v instanceof Vector)

        @x += v.dx
        @y += v.dy

        @__check_bounds()

        return this

    # "Private" methods

    # Boundary check @x and @y
    # @throws {Error} If @x or @y out of bounds
    __check_bounds: ->
        if @gridSize? and not (0 <= @x < @gridSize.x and 0 <= @y < @gridSize.y)
            throw Error("Coord(#{@x}, #{@y}) out of bounds")
