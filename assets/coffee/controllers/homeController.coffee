angular.module('MekManager')
  .controller('HomeController',
  ['User', 'API', '$http', (User, API, $http) ->
    self = this
    self.logged_in = false
    self.form = {user_name: '', password: ''}
    self.user = User.get()

    self.login = () ->
      if(this.name != '' && this.password != '')
        API.login(self.form).then(
          (response) ->
            self.logged_in = true
            console.log('success')
          ,(errResponse) ->
            console.log('error')
        )
      else
        console.log('bad values')
        return
    return
  ])
