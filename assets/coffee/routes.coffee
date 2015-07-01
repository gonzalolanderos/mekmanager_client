angular.module('MekManager')
  .config(['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/', {
        templateUrl: 'assets/templates/home.html'
        controller: 'HomeController'
      })
      .when('/about', {
        templateUrl: 'assets/templates/about.html'
        controller: 'AboutController'
      })
      .when('/privacy', {
        templateUrl: 'assets/templates/privacy.html'
        controller: 'PrivacyController'
      })
      .otherwise({
        redirectTo: '/'
      })
    return
])
