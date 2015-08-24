angular.module('MekManager').factory('User', [ ->
  @data = {}
  @language = {}
  @loggedIn = false

  {
    get: => @data

    authorization: => {id: @data.id, token: @data.token}

    set: (values) =>
      @data = values
      @loggedIn = true
      if @data.language?
        $.getJSON("./lang/#{@data.language}.json", (response) =>
          @language = response
          console.log(@language)
        )
      @data

    wipe: => @data = {}

    isLoggedIn: => @loggedIn

    language: => @language
  }
])
