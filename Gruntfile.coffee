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
                    globals: ["Ext","entropy","describe","it","expect","beforeEach"]
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

        # istanbul setup
        instrument:
            files: "app/**/*.js"
            options:
                basePath: "build/output/coverage"
        storeCoverage:
            options:
                dir: "build/output/coverage"
        makeReport:
            src: "build/output/coverage/*.json"
            options:
                type: "lcov"
                dir: "build/reports"
                
        # jasmine tests
        sencha_jasmine:
            tests:
                options:
                    extFramework: "touch/" # TODO: relies on symlink from sencha-touch-all-debug.js to ext-all-debug.js
                    extLoaderPaths:
                        "entropy": "build/output/coverage/app/" # "entropy": "app/"
                    specs: "tests/specs/**/*.js"
                    helpers: ["node_modules/jasmine-sencha/jasmine-sencha.js"]
                    keepRunner: false

        # plato setup
        plato:
            tests:
                files:
                    "build/reports/plato": "app/**/*.js"

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
    grunt.loadNpmTasks "grunt-istanbul"
    grunt.loadNpmTasks "grunt-plato"

    grunt.registerTask "compile", ["coffee_jshint:src","coffee:src"]
    grunt.registerTask "test", ["coffee_jshint:tests","coffee:tests","instrument","sencha_jasmine:tests","storeCoverage","makeReport","plato:tests"]

    # for istanbul storeReport
    grunt.event.on "jasmine.coverage", (coverage) ->
        global.__coverage__ = coverage
