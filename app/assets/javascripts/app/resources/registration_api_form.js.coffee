angular.module('app.resources')

.factory 'RegistrationApiFormResource', ['$resource', ($resource) ->
  $resource '/registrations/:id', { id: '@_id' },
  update:
    method: 'PUT'
]
