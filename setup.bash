#!/usr/bin/bash

set -e

if [ -e config.json ]
then
    echo 'a config file exists, no need to make one'
else
    echo 'making a default config file...'
    echo '{"url": "'"'http://localhost:3000/v1'"'"}' > config.json
fi

npm install
bower install

mkdir assets/js
mkdir assets/js/controllers
mkdir assets/js/factories
mkdir assets/src
mkdir assets/templates
mkdir assets/templates/directives

gulp vendorJS
gulp vendorCSS
gulp copyFonts
gulp coffee
gulp js
gulp sass
gulp jade
