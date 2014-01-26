module.exports = ->
    @Before = (callback) ->
        @spooky.start()
        callback()

    @After = (callback) ->
        @spooky.destroy()
        callback()
