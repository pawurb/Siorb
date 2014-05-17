backendDir = '/Users/pablo/Programming/Ruby/railsy/Siorbackend'

gulp       = require 'gulp'
watch      = require 'gulp-watch'
coffee     = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
concat     = require 'gulp-concat'
uglify     = require 'gulp-uglify'
gutil      = require 'gulp-util'
rename     = require 'gulp-rename'
livereload = require 'gulp-livereload'


gulp.task 'default', ->
  gulp.watch(['src/*', 'src/*/**' ], ['coffee'])

#compile coffee to js and enable source maps
gulp.task 'coffee', ->
  gulp.src(['src/*.coffee', 'src/**/*.coffee'])
  .pipe(coffeelint('.cshintrc.json'))
  .pipe(coffeelint.reporter())
  .pipe(concat('siorb.coffee'))
  .pipe(gulp.dest('dist/'))
  .pipe(coffee({bare: false, sourceMap: true})).on('error', gutil.log)
  .pipe(gulp.dest('dist/'))
  .pipe(livereload())

  gutil.log(gutil.colors.green('JavaScript Compiled'))

#minify code and save as siorb-min.js
gulp.task 'release', ->
  scriptsDir = "#{backendDir}/app/assets/javascripts"

  gulp.src(['dist/siorb.js'])
  .pipe(uglify())
  .pipe(rename("siorb-min.js"))
  .pipe(gulp.dest('dist'))
  .pipe(gulp.dest(scriptsDir))

  gulp.src(['dist/crafty-min.js'])
  .pipe(gulp.dest(scriptsDir))

  gulp.src(['dist/styles.css'])
  .pipe(gulp.dest("#{backendDir}/app/assets/stylesheets"))

  gulp.src(['assets/images/*'])
  .pipe(gulp.dest("#{backendDir}/public/assets/images"))




