angular.module('app.resources')

.factory 'RegistrationFormResource', ['$resource', ($resource) ->
  $resource 'http://localhost:3000/registrations#create', {},
    create:
      method: 'POST'
]

