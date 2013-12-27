module.exports = (grunt) ->
    grunt.initConfig
        # set package information from npm package
        pkg: grunt.file.readJSON "package.json"

        # jshint
        coffee_jshint:
            options:
                globals: ["Ext"]
            src:
                src: "app/**/*.coffee"
            tests:
                src: "tests/specs/**/*.coffee"

        # coffee compilation for all app and test coffee scripts
        coffee:
            src:
                options:
                    sourceMap: false
                files: [
                    expand: true
                    src: ["app/**/*.coffee"]
                    ext: ".js"
                ]
            tests:
                options:
                    sourceMap: false
                files: [
                    expand: true
                    src: ["tests/**/*.coffee"]
                    ext: ".js"
                ]

        # jasmine tests
        jasmine:
            tests:
#                src: ["app/**/*.js","app.js","bootstrap.js","touch/**/*.js"]
                options:
                    specs: "tests/specs/**/*.js"
                    helpers: "tests/helpers/**/*.js"
                    template : require "grunt-template-jasmine-istanbul"
                    templateOptions:
                        coverage: "build/reports/coverage.json"
                        report: "build/reports/coverage"

        # watch config
        watch:
            src:
                files: ["app/**/*.coffee", "tests/**/*.coffee"]
                tasks: ["coffee_jshint:src","coffee:src"]
            tests:
                files: ["tests/**/*.js"]
                tasks: ["coffee_jshint:tests","coffee:tests","jasmine:tests"]

    grunt.loadNpmTasks "grunt-coffee-jshint"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-jasmine"
    grunt.loadNpmTasks "grunt-contrib-watch"

    grunt.registerTask "default", "coffee:src"
    grunt.registerTask "default", "jasmine:tests"
