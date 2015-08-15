angular.module('MekManager')
  .controller('HomeController', ['User', 'API', (User, API) ->
    @logged_in = false
    @form = {user_name: '', password: ''}
    @user = User.get()

    @login = =>
      if(@form.user_name != '' && @form.password != '')
        API.sign_in(@form).then(
          (response) =>
            @logged_in = true
            User.set(response.data)

          ,(errResponse) ->
            console.log('error')
        )
      else
        console.log('bad values')
        return
    return
  ])
