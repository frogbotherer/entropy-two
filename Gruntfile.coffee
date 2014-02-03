module.exports = (grunt) ->
    grunt.initConfig
        # set package information from npm package
        pkg: grunt.file.readJSON "package.json"

        # jshint
        coffee_jshint:
            src:
                options:
                    globals: [
                        "Ext",
                        "entropy","Coord","Vector","Grid",
                        "alert",
                        ]
                src: "app/**/*.coffee"
            tests:
                options:
                    globals: [
                        "Ext",
                        "entropy","Coord","Vector","Grid",
                        "describe","it","xit","expect","beforeEach","alert","fail",
                        "done","runs","waitsFor","AsyncSpec",
                        ]
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

        # cson compilation for json
        cson:
            src:
                files: [
                    expand: true
                    src: ["resources/data/*.cson"]
                    ext: ".json"
                ]

        # sencha dependencies
        sencha_dependencies:
            build: "."
            options:
                appFile: "app.js"

        # istanbul setup
        instrument:
            files: ["app/**/*.js","app.js"]
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
                    extFramework: "touch/" # produces 404 on ext-all-debug.js - we use sencha-touch-all-debug instead (in helpers below)
                    extLoaderPaths:
                        "entropy": ["build/output/coverage/app"] # "entropy": "app/"
                    specs: "tests/specs/**/*.js"
                    helpers: ["touch/sencha-touch-all-debug.js","node_modules/jasmine-sencha/jasmine-sencha.js","node_modules/Jasmine.Async/src/jasmine.async.js"]
                    keepRunner: true

        # cucumber tests
        cucumberjs:
            tests:
                src: "tests/features"
                options:
                    steps: "tests/steps"

        # plato setup
        plato:
            build:
                files:
                    "build/reports/plato": "<%= sencha_dependencies_build_app %>"

        # jsduck generated documentation
        jsduck:
            build:
                src: "<%= sencha_dependencies_build_app %>"
                #src: "app/**/*.js"
                dest: "build/docs"

        # ripple emulator
        ripple:
            options:
                path: process.cwd()
                open: false
            run:
                options:
                    keepAlive: true
            watch_run:
                options:
                    keepAlive: false

        # watch config
        watch:
            src:
                files: ["app/**/*.coffee","resources/data/*.cson"]
                tasks: ["compile"]
            tests:
                files: ["tests/**/*.coffee","app.js"]
                tasks: ["test"]
            all:
                files: ["app/**/*.coffee","resources/data/*.cson","tests/**/*.coffee","app.js"]
                tasks: ["compile_and_test"]

    # load tasks
    grunt.loadNpmTasks "grunt-coffee-jshint"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-cson"
    grunt.loadNpmTasks "grunt-sencha-jasmine"
    grunt.loadNpmTasks "grunt-cucumber"
    grunt.loadNpmTasks "grunt-sencha-dependencies"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-istanbul"
    grunt.loadNpmTasks "grunt-plato"
    grunt.loadNpmTasks "grunt-jsduck"
    grunt.loadNpmTasks "grunt-ripple-emulator"

    # register tasks
    grunt.registerTask "compile", ["coffee_jshint:src","coffee:src","cson:src"]
    grunt.registerTask "test", ["coffee_jshint:tests","coffee:tests","instrument","sencha_jasmine:tests","cucumberjs:tests","storeCoverage","makeReport"]
    grunt.registerTask "build", ["sencha_dependencies:build","plato:build","jsduck:build"]
    grunt.registerTask "run", ["ripple:run"]

    # register metatasks
    grunt.registerTask "compile_and_test", ["compile","test"]

    # for istanbul storeReport
    grunt.event.on "jasmine.coverage", (coverage) ->
        global.__coverage__ = coverage

    # only compile stuff that's actually changed
    grunt.event.on "watch", (action, filepath) ->
        grunt.config "coffee_jshint:#{action}"
        grunt.config "coffee:#{action}"
        grunt.config "cson:#{action}"
