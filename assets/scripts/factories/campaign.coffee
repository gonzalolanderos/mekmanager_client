angular.module('MekManager').factory('Campaign', [ ->
  @data = []

  {
    load: (data) => @data = data

    # currently, we're only using one campaign to a user
    get: => @data[0]
  }
])
