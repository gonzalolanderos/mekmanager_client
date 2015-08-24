angular.module('MekManager')
  .controller('HangarController', ['User', 'Unit', (User, Unit) ->
    @units = Unit.get()
    @user = User.get()
    @language = User.language()

    @loggedIn = -> User.isLoggedIn()

    @currentMechSet = => @currentMech?

    @currentMechId = => @currentMech.id

    @setCurrent = (id) =>
      @currentMech.status = null if @currentMech?
      @currentMech = _.find(@units, 'id', id)
      @currentMech.status = 'active'

    @sell = -> console.log('not yet implemented')

    @repair = => @currentMech.fullRepair() if @currentMech?

    @resolve = (x) =>
      if @language.common? && @language.common[x]?
        @language.common[x]
      else
        x

    return
])
