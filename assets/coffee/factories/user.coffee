angular.module('MekManager').factory('User', [ ->
    @data = {}

    return {
      get: => @data

      authorization: => {user: {id: @data.id, token: @data.token}}

      set: (values) =>
        @data.user_name = values.user_name
        @data.email = values.email
        @data.token = values.token
        @data.id = values.id
        @data.given_name = values.given_name
        @data.surname = values.surname
        return

      wipe: => @data = {}
    }
])
