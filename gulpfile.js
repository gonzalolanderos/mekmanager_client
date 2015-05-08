var gulp = require('gulp'),
    coffee = require('gulp-coffee'),
    coffeelint = require('gulp-coffeelint'),
    concat = require('gulp-concat'),
    cssmin = require('gulp-cssmin'),
    jade = require('gulp-jade'),
    jshint = require('gulp-jshint'),
    sass = require('gulp-sass'),
    rename = require('gulp-rename'),
    uglify = require('gulp-uglify'),
    webserver = require('gulp-webserver'),
    vendorJSFiles = [
        'bower_components/angular/angular.js',
        'bower_components/jquery/dist/jquery.js',
        'bower_components/bootstrap/dist/js/bootstrap.js'
    ],
    vendorCSSFiles = [
        'bower_components/bootstrap/dist/css/bootstrap.css',
        'bower_components/fontawesome/css/font-awesome.css'
    ];

gulp.task('default', ['watch']);

gulp.task('init', ['vendorJS', 'vendorCSS', 'copyFonts', 'sass', 'jade']);

gulp.task('serve', function() {
    gulp.src('.')
        .pipe(webserver({
            fallback: 'index.html',
            livereload: true,
            directoryListening: true,
            open: true
        }));
});

gulp.task('sass', function() {
    gulp.src('assets/sass/*.sass')
        .pipe(sass({indentedSyntax: true}))
        .on('error', function(e) {
            console.log(e);
            console.log(e.message);
            this.emit('end');
        })
        .pipe(cssmin())
        .pipe(gulp.dest('assets/css'));
});

gulp.task('jade', function() {
    return gulp.src('jade/*.jade')
        .pipe(jade())
        .on('error', function(e) {
            console.log(e);
            console.log(e.message);
            this.emit('end');
        })
        .pipe(gulp.dest('.'));
});

gulp.task('vendorJS', function() {
    gulp.src(vendorJSFiles)
        .pipe(concat('vendor.js'))
        .pipe(gulp.dest('vendor/js'))
        .pipe(rename('vendor.min.js'))
        .pipe(uglify())
        .pipe(gulp.dest('vendor/js'));
});

gulp.task('vendorCSS', function() {
    gulp.src(vendorCSSFiles)
        .pipe(concat('vendor.css'))
        .pipe(gulp.dest('vendor/css'))
        .pipe(rename('vendor.min.css'))
        .pipe(cssmin())
        .pipe(gulp.dest('vendor/css'));
});

gulp.task('copyFonts', function() {
    gulp.src('bower_components/bootstrap/fonts/*')
        .pipe(gulp.dest('vendor/fonts'));
    gulp.src('bower_components/fontawesome/fonts/*')
        .pipe(gulp.dest('vendor/fonts'));
});

gulp.task('watch', function() {
    gulp.watch('jade/*.jade', ['jade']);
    gulp.watch('assets/sass/*.sass', ['sass']);
});
