Ext.define "entropy.model.Game", ->
    extend: "Ext.data.Model"
    config:
        fields: [
            name: 'id'
            type: 'int'
        ,
            name: 'hash'
            type: 'auto'
        ,
            name: 'difficulty'
            type: 'int'
        ]
