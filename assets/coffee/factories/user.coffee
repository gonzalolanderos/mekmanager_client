angular.module('MekManager')
  .factory('User', ['$http', '$window', '$q', ($http, $window, $q) ->
    data = {}

    return {
      get: () ->
        return data

      set_user_name: (name) ->
        data.user_name = name
        return

      set: (values) ->
        data.user_name = values.user_name
        data.email = values.email
        data.token = values.token
        data.id = values.id
        data.given_name = values.given_name
        data.surname = values.surname
        return

      wipe: () ->
        data = {}
        return
    }
])
