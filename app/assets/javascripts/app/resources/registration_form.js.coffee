angular.module('app.resources')

.factory 'RegistrationFormResource', ['$resource', ($resource) ->
  $resource window.location.origin + '/registrations#create', {},
    create:
      method: 'POST'
]
