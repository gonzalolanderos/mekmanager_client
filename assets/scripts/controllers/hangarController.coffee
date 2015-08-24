angular.module('MekManager')
  .controller('HangarController', ['User', 'Unit', (User, Unit) ->
    @units = Unit.get()
    @user = User.get()
    @language = User.language()

    @loggedIn = -> User.isLoggedIn()

    @currentMechInfo = => _.find(@units, 'id', @currentMech).id

    @setCurrent = (id) =>
      console.log('happened')
      console.log(id)
      @currentMech = id
      console.log(@currentMech)
      console.log(_.find(@units, 'id', @currentMech))

    @sell = -> console.log('not yet implemented')

    @repair = =>
      if @currentMech?
        _.find(@units, 'id', @currentMech).fullRepair()
        # @units[_.find(@units, 'id', @currentMech)].fullRepair()

    @resolve = (x) =>
      if @language.common? && @language.common[x]?
        @language.common[x]
      else
        x

    return
])
