angular.module('MekManager').factory('Unit', ['Chassis', 'Variant',
  (Chassis, Variant) ->
    @units = []

    {
      load: (units) =>
        for unit in units
          unit.variantName = ->
            Variant.getName(@variant_id)
          unit.chassisName = ->
            Chassis.getName(Variant.getChassis(@variant_id))
          @units.push(unit)
        @units

      get: => @units

      testAdd: (data) =>
        @units.push(data)
    }
])
