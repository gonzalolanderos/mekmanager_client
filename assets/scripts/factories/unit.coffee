angular.module('MekManager').factory('Unit', ['API', 'Chassis', 'Variant',
  (API, Chassis, Variant) ->
    @units = []

    {
      load: (units) =>
        for unit in units
          unit.variantName = ->
            Variant.getName(@variant_id)

          unit.variantPrice = ->
            Variant.getPrice(@variant_id)

          unit.currentPrice = ->
            (Variant.getPrice(@variant_id) * (@condition * .01))

          unit.chassisName = ->
            Chassis.getName(Variant.getChassis(@variant_id))

          unit.getStatus = ->
            if @condition >= 50
              'success'
            else if @condition >= 25
              'warning'
            else
              'danger'

          unit.damage = ->
            if @condition - 10 < 0
              @condition = 0
            else
              @condition -= 10
            API.updateUnit(@id, @).then(
              (response) ->
                console.log('updated')
              ,(errResponse) ->
                console.log('not updated')
            )

          unit.repair = ->
            if @condition + 10 > 100
              @condition = 100
            else
              @condition += 10
            API.updateUnit(@id, @).then(
              (response) ->
                console.log('updated')
              ,(errResponse) ->
                console.log('not updated')
            )

          unit.fullRepair = ->
            @condition = 100
            API.updateUnit(@id, @).then(
              (response) ->
                console.log('updated')
              ,(errResponse) ->
                console.log('not updated')
            )

          unit.setDamage = ->
            if @tempCondition? &&
               _.parseInt(@tempCondition) <= 100 &&
               _.parseInt(@tempCondition) >= 0
                @condition = _.parseInt(@tempCondition)
                API.updateUnit(@id, @).then(
                  (response) ->
                    console.log('updated')
                  ,(errResponse) ->
                    console.log('not updated')
                )

          @units.push(unit)
        @units

      get: => @units

      testAdd: (data) =>
        @units.push(data)
    }
])
