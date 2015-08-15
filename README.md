# MekManager: Client

[![Code Climate](https://img.shields.io/codeclimate/github/MekManager/mekmanager_client.svg?style=flat-square)](https://codeclimate.com/github/MekManager/mekmanager_client)
[![David](https://img.shields.io/david/dev/MekManager/mekmanager_client.svg?style=flat-square)]()

[![Gitter](https://img.shields.io/badge/Gitter-Join%20Chat%20%E2%86%92-1dce73.svg?style=flat-square)](https://gitter.im/MekManager/mekmanager_api?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
[![GitHub license](https://img.shields.io/github/license/MekManager/mekmanager_client.svg?style=flat-square)](https://www.gnu.org/copyleft/gpl.html)

The unofficial BattleTech campaign manager

### Installation

Setting up the development environment for the client page takes three steps,
provided you have node, npm, gulp, and bower already installed. All four of
these projects have through installation instructions, so it would be pointless
to repeat them here. Once you have those programs installed you can proceed
to the next steps.

Setting up the MekManager client is straightforward and painless,
simply run the following commands. Note: if you've never installed
much of anything (or anything at all) with npm, it may take a
minute or so to install.
```
npm install
bower install
gulp init
```

Note: Some distros may need you to manually create some of the compiled
directories. If you run ```gulp init``` and you are missing some files run
the following and then re-run the ```init``` command.
```
mkdir assets/js
mkdir assets/src
mkdir assets/templates
```

These commands will do the following:
 1. Install all of the dev dependencies to run gulp. These include programs
    to compile sass files, lint JavaScript, etc.
 2. Install the libraries, frameworks and other resources the site itself
    utilizes. This includes things like Twitter Bootstrap and AngularJS
 3. Generate all the compiled files for the project. This includes making the
    vendor folder, and generating all of the html files.

Once these steps are done you can check and make sure that the MekManager
client setup correctly by running
```
gulp serve
```
Which should open the index.html page in your system's default browser.
