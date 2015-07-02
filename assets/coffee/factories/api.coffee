angular.module('MekManager').factory('API', ['$http', ($http) ->
  return {
    login: (data) ->
      if (data.user_name != '' && data.password != '')
        $http.post('http://localhost:3000/v1/sign-in', data)
      else
        console.log('bad values')
        return
  }
])
