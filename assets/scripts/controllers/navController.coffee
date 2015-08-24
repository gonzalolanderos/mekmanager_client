angular.module('MekManager').controller('NavController', ['User', (User) ->

  @loggedIn = -> User.isLoggedIn()

  @resolve = (x) ->
    if User.language() && User.language().nav?
      if User.language().nav[x]? then User.language().nav[x] else x
    else
      x
  return
])
