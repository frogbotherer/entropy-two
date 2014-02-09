# instantiate custom types properly (let's hope anyway)
Ext.define "entropy.type.CustomTypeFactory",
    singleton: true
    requires: [
        "entropy.type.GridType",
        "entropy.util.Coord",
        "entropy.util.Grid",
        ]
    # sync require custom type and add to Ext types object
    # @param {string} Custom type to add (e.g. entropy.types.GridType)
    # @param {string} Property to add to Types object (e.g. GRID)
    # @return {object} Ext.data.Types.{Property}
    create: (customType, property) ->
        t = {}
        Ext.syncRequire(customType)
        t[property] = Ext.ClassManager.get(customType)

        Ext.applyIf Ext.data.Types, t
        Ext.data.Types[property]

