var gulp = require('gulp');
var cssmin = require('gulp-cssmin');
var rename = require('gulp-rename');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');

gulp.task('default', function() {
  // please code for your default task here
});

gulp.task('css.min', function() {
  console.log('---------- cssmin task ----------');
  gulp.src('css/*.css')
    .pipe(cssmin())
    .pipe(rename({suffix: '.min'}))
    .pipe(gulp.dest('min_css/'));
});

gulp.task('js.concat', function() {
  console.log('---------- js.concat task ----------');
  return gulp.src('js/*.js')
    .pipe(concat('main.js'))
    .pipe(gulp.dest('min_js/'));
});

gulp.task('js.uglify', ['js.concat'], function() {
  console.log('---------- js.uglify task ----------');
  gulp.src('min_js/main.js')
    .pipe(uglify({preserveComments: 'some'}).on('error', function(e) {
      console.log(e);
    }))
    .pipe(rename({suffix: '.min'}))
    .pipe(gulp.dest('min_js/'));
});

gulp.task('js', ['js.concat', 'js.uglify']);

gulp.task('watchjs', function() {
  gulp.watch(['js/*.js'], ['js']);
});
