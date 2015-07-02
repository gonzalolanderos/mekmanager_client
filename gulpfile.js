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
    angularFiles = [
        'assets/js/app.js',
        'assets/js/routes.js',
        'assets/js/factories/*.js',
        'assets/js/controllers/*.js'
    ],
    vendorJSFiles = [
        'bower_components/jquery/dist/jquery.js',
        'bower_components/angular/angular.js',
        'bower_components/angular-route/angular-route.js',
        'bower_components/bootstrap/dist/js/bootstrap.js'
    ],
    vendorCSSFiles = [
        'bower_components/bootstrap/dist/css/bootstrap.css',
        'bower_components/fontawesome/css/font-awesome.css'
    ];

// generic function for vendor file compression
function jadeHandler(dir, outDir) {
    gulp.src(dir + '*.jade')
        .pipe(jade())
        .on('error', function(e) {
            handleError(e, this);
        })
        .pipe(gulp.dest(outDir));
}

function coffeeHandler(dir) {
    gulp.src('./assets/coffee/' + dir + '*.coffee')
        .pipe(coffee())
        .on('error', function(e) {
            handleError(e, this);
        })
        .pipe(gulp.dest('./assets/js/' + dir));
}

function vendor(type, files, compressor) {
    gulp.src(files)
        .pipe(concat('vendor.' + type))
        .pipe(gulp.dest('vendor/' + type))
        .pipe(rename('vendor.min.' + type))
        .pipe(compressor())
        .pipe(gulp.dest('vendor/' + type));
}

function handleError(error, self) {
    console.log(error);
    console.log(error.message);
    self.emit('end');
}

gulp.task('default', ['watch']);

gulp.task('init', ['vendorJS', 'vendorCSS', 'copyFonts', 'coffee', 'js',
                   'sass', 'jade']);

gulp.task('serve', function() {
    gulp.src('.')
        .pipe(webserver({
            fallback: 'index.html',
            livereload: true,
            directoryListening: true,
            open: true
        }));
});

gulp.task('coffee', function() {
    coffeeHandler('');
    coffeeHandler('controllers/');
    coffeeHandler('factories/');
});

gulp.task('coffeelint', function() {
    gulp.src('./assets/**/*.coffee')
        .pipe(coffeelint({optFile: './coffeelint.json'}))
        .pipe(coffeelint.reporter());
});

gulp.task('sass', function() {
    gulp.src('assets/sass/*.sass')
        .pipe(sass({indentedSyntax: true}))
        .on('error', function(e) {
            handleError(e, this);
        })
        .pipe(cssmin())
        .pipe(gulp.dest('assets/css'));
});

gulp.task('jade', function() {
    jadeHandler('./', './');
    jadeHandler('./assets/jade/', './assets/templates/');
});

gulp.task('js', function() {
    gulp.src(angularFiles)
        .pipe(concat('app.js'))
        .pipe(gulp.dest('assets/js'))
        .pipe(rename('app.min.js'))
        .pipe(uglify())
        .pipe(gulp.dest('assets/js'));
});

gulp.task('vendorJS', vendor('js', vendorJSFiles, uglify));

gulp.task('vendorCSS', vendor('css', vendorCSSFiles, cssmin));

gulp.task('copyFonts', function() {
    gulp.src('bower_components/bootstrap/fonts/*')
        .pipe(gulp.dest('vendor/fonts'));
    gulp.src('bower_components/fontawesome/fonts/*')
        .pipe(gulp.dest('vendor/fonts'));
});

gulp.task('watch', function() {
    gulp.watch('*.jade', ['jade']);
    gulp.watch('assets/jade/*.jade', ['jade']);
    gulp.watch('assets/sass/*.sass', ['sass']);
    gulp.watch('./assets/**/*.coffee', ['coffee', 'coffeelint']);
    gulp.watch('./assets/js/*.js', ['js']);
});
