angular.module 'MekManager'
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/', {
        templateUrl: 'assets/templates/home.html'
        controller: 'HomeController'
      }
      .when '/about', {
        templateUrl: 'assets/templates/about.html'
        controller: 'AboutController'
      }
      .otherwise {
        redirectTo: '/'
      }
    return
]
