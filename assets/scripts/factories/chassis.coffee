angular.module('MekManager').factory('Chassis', ->
  @data = []

  {
    load: (data) => @data = data

    getName: (id) => @data[(id - 1)].name
  }
)
