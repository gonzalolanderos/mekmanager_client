angular.module('MekManager').factory('Variant', ->
  @data = []

  {
    load: (data) => @data = data

    getName: (id) => @data[(id - 1)].name

    getChassis: (id) => @data[(id - 1)].chassis_id
  }
)
