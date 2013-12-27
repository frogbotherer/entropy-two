module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON "package.json"
        coffee:
            compile:
                options:
                    sourceMap: true
                files: [
                    expand: true
                    src: ["app/**/*.coffee", "tests/**/*.coffee"]
                    ext: ".js"
                ]


    grunt.loadNpmTasks "grunt-contrib-coffee"

    grunt.registerTask "default", "coffee:compile"
