module.exports = (grunt) ->
  grunt.initConfig
    pkg: '<json:package.json>'

    watch:
      coffee:
        files: ["src/**/*.coffee"]
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
            "src/settings.coffee",
            "src/entities/*.coffee"
          ]
    coffeelint:
      options:
        max_line_length:
          value: 120
          level: "warn"
      gruntfile: "Gruntfile.coffee"
      src: ["src/**/*.coffee"]


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks "grunt-coffeelint"

  grunt.registerTask 'default', ['coffee', 'watch']