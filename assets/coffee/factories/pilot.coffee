angular.module('MekManager').factory('Pilot', [ ->
  @data = []

  {
    get: => @data

    load: (data) => @data = data
  }
])
