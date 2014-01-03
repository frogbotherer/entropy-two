Ext.define "entropy.util.Vector",
    alternateClassName: "Vector"

    #constructor: (@dx, @dy) ->
    constructor: (@dx, @dy) ->

    toString: ->
        "Vector(#{@dx}, #{@dy})"

    add: (v) ->
        # sanity
        throw Error("Can't add #{v} to #{this}") if not (v instanceof Vector)

        return new Vector(@dx + v.dx, @dy + v.dy)
