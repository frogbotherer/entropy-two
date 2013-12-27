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

        # jasmine tests
        jasmine:
            test:
                src: ["app/**/*.js","app.js","bootstrap.js","touch/**/*.js"]
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
                tasks: ["compile"]
            test:
                files: ["tests/**/*.js"]
                tasks: ["test"]

    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-jasmine"
    grunt.loadNpmTasks "grunt-contrib-watch"

    grunt.registerTask "default", "coffee:compile"
    grunt.registerTask "default", "jasmine:test"
