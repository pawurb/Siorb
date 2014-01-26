module.exports = (grunt) ->
  grunt.initConfig
    pkg: '<json:package.json>'

    watch:
      coffee:
        files: ["src/**/*.coffee", "devel_index.html"]
        tasks: [
          "coffeelint:src"
          "coffee:src"
        ]
        options:
          livereload: true

    coffee:
      src:
        options:
          join: true
          sourceMap: true
        files:
          "dist/Siorb.js" : [
            "src/utils/*.coffee"
            "src/game.coffee"
            "src/scenes/*.coffee"
            "src/core/*.coffee"
            "src/components/*.coffee"
            "src/interfaces/*.coffee"
            "src/entities/*.coffee"
          ]

    coffeelint:
      options:
        max_line_length:
          value: 120
          level: "warn"
      gruntfile: "Gruntfile.coffee"
      src: ["src/**/*.coffee"]

    copy:
      main:
        files: [
          expand: true,
          cwd: 'assets/',
          src: ['**/*'],
          dest: "../ShellySiorb/public/assets/"
        ,
          src: "dist/siorb.js"
          dest: "../ShellySiorb/public/libs/siorb.js"
        ,
          src: "dist/styles.css"
          dest: "../ShellySiorb/public/libs/styles.css"
        ,
          src: "lib_components/crafty/crafty.js"
          dest: "../ShellySiorb/public/libs/crafty.js"
        ,
          src: "bower_components/underscore/underscore-min.js"
          dest: "../ShellySiorb/public/libs/underscore-min.js"
        ,
          src: "prod_index.html"
          dest: "../ShellySiorb/public/index.html"
        ]


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.registerTask 'default', ['coffee', 'watch']
  grunt.registerTask 'release', ['copy']
