gulp = require 'gulp'

watch = require 'gulp-watch'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'

gulp.task 'default', ->
  gulp.watch(['src/*', 'src/*/**' ], ['tell'])

gulp.task 'tell', ->
  console.log('default task called')
