angular.module('app.resources')

.factory 'RegistrationFormResource', ['$resource', ($resource) ->
  $resource window.location.protocol + '//' + window.location.host + '/registrations', {},
    create:
      method: 'POST'
]
