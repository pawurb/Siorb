backendDir = '/Users/pablo/Programming/Ruby/railsy/Siorbackend
'
module.exports = (grunt) ->
  grunt.initConfig
    pkg: '<json:package.json>'

    watch:
      coffee:
        files: ["src/**/*.coffee", "devel_index.html", "dist/styles.css"]
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
        no_backticks:
          level: "ignore"
      gruntfile: "Gruntfile.coffee"
      src: ["src/**/*.coffee"]

    uglify:
      release:
        files:
          "dist/siorb-min.js": ["dist/siorb.js"]
          "dist/crafty-min.js": ["lib_components/crafty/crafty.js"]
    copy:
      main:
        files: [
          expand: true,
          cwd: 'assets/',
          src: ['**/*'],
          dest: "#{backendDir}/public/assets/"
        ,
          src: "dist/siorb-min.js"
          dest: "#{backendDir}/public/libs/siorb-min.js"
        ,
          src: "dist/styles.css"
          dest: "#{backendDir}/assets/stylesheets/siorb.css"
        ,
          src: "dist/crafty-min.js"
          dest: "#{backendDir}/public/libs/crafty-min.js"
        ,
          src: "bower_components/underscore/underscore-min.js"
          dest: "#{backendDir}/public/libs/underscore-min.js"
        ,
          src: "bower_components/jcarousel/dist/jquery.jcarousel.min.js"
          dest: "#{backendDir}/public/libs/jcarousel-min.js"
        ]


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.registerTask 'default', ['coffee', 'watch']
  grunt.registerTask 'release', ['uglify', 'copy']
