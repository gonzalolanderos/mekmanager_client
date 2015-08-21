angular.module('MekManager').factory('User', [ ->
  @data = {}
  @loggedIn = false

  {
    get: => @data

    authorization: => {user: {id: @data.id, token: @data.token}}

    set: (values) =>
      @data.user_name = values.user_name
      @data.email = values.email
      @data.token = values.token
      @data.id = values.id
      @data.given_name = values.given_name
      @data.surname = values.surname
      @loggedIn = true
      @data

    wipe: => @data = {}

    isLoggedIn: => @loggedIn
  }
])