module.exports = (grunt) ->
    grunt.initConfig
        # set package information from npm package
        pkg: grunt.file.readJSON "package.json"

        # jshint
        coffee_jshint:
            src:
                options:
                    globals: ["Ext"]
                src: "app/**/*.coffee"
            tests:
                options:
                    globals: ["Ext","describe","it","expect"]
                src: "tests/specs/**/*.coffee"

        # coffee compilation for all app and test coffee scripts
        coffee:
            src:
                options:
                    sourceMap: false # TODO: should be true
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

        # sencha dependencies
        sencha_dependencies:
            src: "."
            options:
                appFile: "app.js"

        # jasmine tests
        sencha_jasmine:
            tests:
                options:
                    extFramework: "touch/" # TODO: relies on symlink from sencha-touch-all-debug.js to ext-all-debug.js
                    extLoaderPaths:
                        "entropy": "app/"
                    specs: "tests/specs/**/*.js"
#                    helpers: "tests/helpers/**/*.js" # TODO: put in once helpers exist
#                    TODO: write better template to integrate sencha and istanbul
#                    template: require "grunt-template-jasmine-istanbul"
#                    templateOptions:
#                        coverage: "build/reports/coverage.json"
#                        report: "build/reports/coverage"

        # watch config
        watch:
            src:
                files: ["app/**/*.coffee"]
                tasks: ["compile"]
            tests:
                files: ["tests/**/*.coffee"]
                tasks: ["test"]

    grunt.loadNpmTasks "grunt-coffee-jshint"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-sencha-jasmine"
    grunt.loadNpmTasks "grunt-sencha-dependencies"
    grunt.loadNpmTasks "grunt-contrib-watch"

    grunt.registerTask "compile", ["coffee_jshint:src","coffee:src"]
    grunt.registerTask "test", ["coffee_jshint:tests","coffee:tests","sencha_jasmine:tests"]
