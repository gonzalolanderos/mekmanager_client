angular.module('MekManager').config(['$routeProvider', ($routeProvider) ->
  @templates = 'assets/templates'
  $routeProvider
    .when('/', {
      templateUrl: "#{@templates}/home.html"
      controller: 'HomeController'
      controllerAs: 'home'
    })
    .when('/about', {
      templateUrl: "#{@templates}/about.html"
      controller: 'AboutController'
      controllerAs: 'about'
    })
    .when('/privacy', {
      templateUrl: "#{@templates}/privacy.html"
      controller: 'PrivacyController'
      controllerAs: 'privacy'
    })
    .otherwise({
      redirectTo: '/'
    })
  return
])
