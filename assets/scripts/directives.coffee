directivesDir = './assets/templates/directives'

angular.module('MekManager').directive('siteFooter', ->
  {
    restrict: 'E',
    templateUrl: "#{directivesDir}/footer.html"
  }
).directive('splash', ->
  {
    restrict: 'E'
    templateUrl: "#{directivesDir}/splash.html"
  }
).directive('unitList', ->
  {
    restrict: 'E'
    templateUrl: "#{directivesDir}/unitList.html"
    scope: {
      units: '='
    }
  }
).directive('formName', ->
  {
    restrict: 'E'
    templateUrl: "#{directivesDir}/formName.html"
  }
).directive('formPassword', ->
  {
    restrict: 'E'
    templateUrl: "#{directivesDir}/formPassword.html"
  }
).directive('navBar', ->
  {
    restrict: 'E'
    templateUrl: "#{directivesDir}/navBar.html"
  }
)
