module.exports = (grunt) ->
    grunt.initConfig
        # set package information from npm package
        pkg: grunt.file.readJSON "package.json"

        # coffee compilation for all app and test coffee scripts
        coffee:
            compile:
                options:
                    sourceMap: true
                files: [
                    expand: true
                    src: ["app/**/*.coffee", "tests/**/*.coffee"]
                    ext: ".js"
                ]

        # watch config
        watch:
            src:
                files: ["app/**/*.coffee", "tests/**/*.coffee"]
                tasks: ["default"]

    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-watch"

    grunt.registerTask "default", "coffee:compile"
