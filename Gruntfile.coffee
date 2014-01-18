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
            "src/pools/*.coffee"
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
          src: "dist/siorb.js"
          dest: "libs/siorb.js"
        ,
          src: "libComponents/Crafty/crafty.js"
          dest: "libs/crafty.js"
        ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.registerTask 'default', ['coffee', 'watch']
  grunt.registerTask 'release', ['copy']