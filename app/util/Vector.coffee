# Represents simple 2d vectors
Ext.define "entropy.util.Vector",
    alternateClassName: "Vector"

    # Represent simple 2d vectors
    # @param {int} dX
    # @param {int} dY
    constructor: (@dx, @dy) ->

    # Useful string representation of Vector object
    # @return {String} "Vector(dx, dy)"
    # @method
    toString: ->
        "Vector(#{@dx}, #{@dy})"

    # Adds a vector to this vector and returns a new one
    # @param {Vector} Vector to add
    # @return {Vector} New vector object
    # @throws {Error} If not a vector
    # @method
    add: (v) ->
        # sanity
        throw Error("Can't add #{v} to #{this}") if not (v instanceof Vector)

        return new Vector(@dx + v.dx, @dy + v.dy)
