###
API Factory:
This factory controls all of the interactions with the MekManager API. Each
function will return a $http promise to be handled by whatever calls it. Routes
requiring validation will have it handled inside of this factory.
###
angular.module('MekManager').factory('API', ['$http', 'User', ($http, User) ->
  url = $$url

  ###
  Creates a new object with proper user authorization for PUT requests.
  name: The key to name the provided data by.
  data: The data the user object should be added to.
  return: An object with user authorization.
  ###
  getAuthorizedObject = (name, data) ->
    {
      "#{name}": data,
      'user': User.authorization()
    }

  {
    getBookIndex: ->
      $http.get("#{url}/books")


    getBookDetail: (id) ->
      $http.get("#{url}/books/#{id}")


    getCampaignIndex: (user_id) ->
      $http.get("#{url}/campaigns/user/#{user_id}")


    getCampaignDetail: (id) ->
      $http.get("#{url}/campaigns/#{id}")


    createCampaign: (data) ->
      $http.post("#{url}/campaigns", data)


    updateCampaign: (id, data) ->
      send = getAuthorizedObject('campaign', data)
      $http.put("#{url}/campaigns/#{id}",
                getAuthorizedObject('campaign', data)
      )


    deleteCampaign: (id) ->
      $http.delete("#{url}/campaigns/#{id}", {'user': User.authorization()})


    getChassisIndex: ->
      $http.get("#{url}/chassis")


    getChassisDetail: (id) ->
      $http.get("#{url}/chassis/#{id}/raw")


    getChassisDetailWithVariants: (id) ->
      $http.get("#{url}/chassis/#{id}")


    getDovetailIndex: ->
      $http.get("#{url}/dovetails")


    getDovetailDetail: (id) ->
      $http.get("#{url}/dovetails/#{id}")


    getFactionIndex: ->
      $http.get("#{url}/factions")


    getFactionDetail: (id) ->
      $http.get("#{url}/factions/#{id}")


    getMissionIndex: (operation_id) ->
      $http.get("#{url}/missions/operation/#{operation_id}")


    getMissionDetail: (id) ->
      $http.get("#{url}/missions/#{id}")


    createMission: (data) ->
      $http.post("#{url}/missions", data)


    updateMission: (id, data) ->
      $http.put("#{url}/missions/#{id}", getAuthorizedObject('mission', data))


    deleteMission: (id) ->
      $http.delete("#{url}/missions/#{id}", {'user': User.authorization()})


    getObjectiveIndex: (mission_id) ->
      $http.get("#{url}/objectives/mission/#{mission_id}")


    getObjectiveDetail: (id) ->
      $http.get("#{url}/objectives/#{id}")


    createObjective: (data) ->
      $http.post("#{url}/objectives", data)


    updateObjective: (id, data) ->
      $http.put("#{url}/objectives/#{id}",
                getAuthorizedObject('objective', data)
      )


    deleteObjective: (id) ->
      $http.delete("#{url}/objectives/#{id}", {'user': User.authorization()})


    getOperationIndex: (campaign_id) ->
      $http.get("#{url}/operations/campaign/#{campaign_id}")


    getOperationDetail: (id) ->
      $http.get("#{url}/operations/#{id}")


    createOperation: (data) ->
      $http.post("#{url}/operations", data)


    updateOperation: (id, data) ->
      $http.put("#{url}/operations/#{id}",
                getAuthorizedObject('operation', data)
      )


    deleteOperation: (id) ->
      $http.delete("#{url}/operations/#{id}", {'user': User.authorization()})


    getOptionalBonusIndex: (mission_id) ->
      $http.get("#{url}/optional_bonuses/mission/#{mission_id}")


    getOptionalBonusDetail: (id) ->
      $http.get("#{url}/optional_bonuses/#{id}")


    createOptionalBonus: (data) ->
      $http.post("#{url}/optional_bonuses", data)


    updateOptionalBonus: (id, data) ->
      $http.put("#{url}/optional_bonuses/#{id}",
                getAuthorizedObject('optional_bonus', data)
      )


    deleteOptionalBonus: (id) ->
      $http.delete("#{url}/optional_bonuses/#{id}",
                   {'user': User.authorization()}
      )


    getPilotAttributes: (id) ->
      $http.get("#{url}/pilot_attributes/#{id}")


    createPilotAttributes: (data) ->
      $http.post("#{url}/pilot_attributes", data)


    updatePilotAttributes: (id, data) ->
      $http.put("#{url}/pilot_attributes/#{id}",
                getAuthorizedObject('pilot_attribute', data)
      )


    deletePilotAttributes: (id) ->
      $http.delete("#{url}/pilot_attributes/#{id}",
                    {'user': User.authorization()}
      )


    getPilotSkillIndex: (pilot_id) ->
      $http.get("#{url}/pilot_skills/pilot/#{pilot_id}")


    getPilotSkillDetail: (id) ->
      $http.get("#{url}/pilot_skills/#{id}")


    createPilotSkill: (data) ->
      $http.post("#{url}/pilot_skills", data)


    createPilotSkillsEnMasse: (data_array) ->
      $http.post("#{url}/pilot_skills/mass", data_array)


    updatePilotSkill: (id, data) ->
      $http.put("#{url}/pilot_skills/#{id}",
                getAuthorizedObject('pilot_skill', data)
      )


    deletePilotSkill: (id) ->
      $http.delete("#{url}/pilot_skills/#{id}",
                   {'user': User.authorization()}
      )


    getPilotTraitIndex: (pilot_id) ->
      $http.get("#{url}/pilot_traits/pilot/#{pilot_id}")


    getPilotTraitDetail: (id) ->
      $http.get("#{url}/pilot_traits/#{id}")


    createPilotTrait: (data) ->
      $http.post("#{url}/pilot_traits", data)


    createPilotTraitsEnMasse: (data_array) ->
      $http.post("#{url}/pilot_traits/mass", data_array)


    updatePilotTrait: (id, data) ->
      $http.put("#{url}/pilot_traits/#{id}",
                getAuthorizedObject('pilot_trait', data)
      )


    deletePilotTrait: (id) ->
      $http.delete("#{url}/pilot_traits/#{id}",
                   {'user': User.authorization()}
      )


    getPilotIndex: (campaign_id) ->
      $http.get("#{url}/pilots/campaign/#{campaign_id}")


    getPilotDetail: (id) ->
      $http.get("#{url}/pilots/#{id}")


    createPilot: (data) ->
      $http.post("#{url}/pilots", data)


    updatePilot: (id, data) ->
      $http.put("#{url}/pilots/#{id}",
                getAuthorizedObject('pilot', data)
      )


    deletePilot: (id) ->
      $http.delete("#{url}/pilots/#{id}",
                   {'user': User.authorization()}
      )


    getPilotsForHire: (year) ->
      $http.get("#{url}/pilots/#{year}/for_hire")


    hirePilot: (id, campaign_id) ->
      $http.put("#{url}/pilots/#{id}/hire/#{campaign_id}")


    createResetKey: (data) ->
      $http.post("#{url}/reset_key", data)


    useResetKey: (data) ->
      $http.post("#{url}/reset_key/use", data)


    deleteResetKey: (id) ->
      $http.delete("#{url}/reset_key/#{id}",
                   {'user': User.authorization()}
      )


    getRollTableIndex: ->
      $http.get("#{url}/roll_tables")


    getRollTableDetail: (id) ->
      $http.get("#{url}/roll_tables/#{id}")


    getSkillIndex: ->
      $http.get("#{url}/skills")


    getSkillDetail: (id) ->
      $http.get("#{url}/skills/#{id}")


    getTraitIndex: ->
      $http.get("#{url}/traits")


    getTraitDetail: (id) ->
      $http.get("#{url}/traits/#{id}")


    getUnitIndex: (campaign_id) ->
      $http.get("#{url}/units/campaign/#{campaign_id}")


    getUnitDetail: (id) ->
      $http.get("#{url}/units/#{id}")


    createUnit: (data) ->
      $http.post("#{url}/units", data)


    updateUnit: (id, data) ->
      $http.put("#{url}/units/#{id}", getAuthorizedObject('unit', data))


    deleteUnit: (id) ->
      $http.delete("#{url}/units/#{id}",
                   {'user': User.authorization()}
      )


    getUnitsForSale: (year) ->
      $http.get("#{url}/units/#{year}/for_sale")


    buyUnit: (id, campaign_id) ->
      $http.put("#{url}/units/#{id}/buy/#{campaign_id}")


    getUserConfigurationDetail: (id) ->
      $http.get("#{url}/user_configuration/#{id}")


    createUserConfiguration: (data) ->
      $http.post("#{url}/user_configuration", data)


    updateUserConfiguration: (id, data) ->
      $http.put("#{url}/user_configuration/#{id}",
                getAuthorizedObject('user_configuration', data)
      )


    deleteUserConfiguration: (id) ->
      $http.delete("#{url}/user_configuration/#{id}",
                   {'user': User.authorization()}
      )


    sign_up: (data) ->
      $http.post("#{url}/users", data)


    sign_in: (data) ->
      $http.post("#{url}/sign_in", data)


    updateUser: (id, data) ->
      $http.put("#{url}/users/#{id}",
                addUserAutherization('user', data)
      )


    deleteUser: (id) ->
      $http.delete("#{url}/users/#{id}",
                   {'user': User.authorization()}
      )


    getVariantIndex: ->
      $http.get("#{url}/variants")


    getVariantDetail: (id) ->
      $http.get("#{url}/variants/#{id}/raw")


    getVariantDetailWithChassis: (id) ->
      $http.get("#{url}/variants/#{id}")
  }
])
