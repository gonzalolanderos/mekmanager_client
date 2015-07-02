angular.module('MekManager')
  .config(['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/', {
        templateUrl: 'assets/templates/home.html'
        controller: 'HomeController'
        controllerAs: 'home'
      })
      .when('/about', {
        templateUrl: 'assets/templates/about.html'
        controller: 'AboutController'
        controllerAs: 'about'
      })
      .when('/privacy', {
        templateUrl: 'assets/templates/privacy.html'
        controller: 'PrivacyController'
        controllerAs: 'privacy'
      })
      .otherwise({
        redirectTo: '/'
      })
    return
])
