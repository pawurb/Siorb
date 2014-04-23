gulp = require 'gulp'
watch = require 'gulp-watch'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
gutil = require 'gulp-util'

gulp.task 'default', ->
  gulp.watch(['src/*', 'src/*/**' ], ['coffee'])

gulp.task 'coffee', ->
  gulp.src(['src/*.coffee', 'src/**/*.coffee'])
  .pipe(coffeelint('.cshintrc.json'))
  .pipe(coffeelint.reporter())
  .pipe(coffee({bare: true})).on('error', gutil.log)
  .pipe(uglify({outSourceMap: false}))
  .pipe(concat('Siorbagulp.js'))
  .pipe(gulp.dest('dist/'))

  gutil.log(gutil.colors.red('JavaScript Compiled'))

