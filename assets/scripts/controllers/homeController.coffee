angular.module('MekManager')
  .controller('HomeController',
  ['User', 'API', 'Chassis', 'Variant', 'Unit', 'Campaign', 'Pilot',
  (User, API, Chassis, Variant, Unit, Campaign, Pilot) ->
    @form = {user_name: '', password: ''}
    @loggedIn = User.isLoggedIn()
    @language = User.language()
    @campaign = Campaign.get()
    @user = User.get()
    @units = Unit.get()
    @pilots = Pilot.get()

    @login = =>
      if(@form.user_name != '' && @form.password != '')
        API.sign_in(@form).then(
          (response) =>
            @loggedIn = true
            @user = User.set(response.data)
            @getCampaigns(@user.id)
            @getChassis()
            @getVariants()
        )
      else
        console.log('bad values')
        return

    @getVariants = ->
      API.getVariantIndex().then(
        (response) ->
          Variant.load(response.data)
      )

    @getChassis = ->
      API.getChassisIndex().then(
        (response) ->
          Chassis.load(response.data)
      )

    @getCampaigns = (id) =>
      API.getCampaignIndex(id).then(
        (response) =>
          @campaign = Campaign.load(response.data[0])
          @getUnits(@campaign.id)
    )

    @getUnits = (campaign_id) =>
      API.getUnitIndex(campaign_id).then(
        (response) =>
          @units = Unit.load(response.data)
      )

    @getPilots = (campaign_id) =>
      API.getPilotIndex(campaign_id).then(
        (response) =>
          @pilots = Pilot.load(response.data)
      )

    @resolve = (x) => @language.common[x] || x

    return
  ])
