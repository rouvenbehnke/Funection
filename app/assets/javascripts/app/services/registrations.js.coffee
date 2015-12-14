angular.module('app.services')

.factory 'Registration', ['$resource', ($resource) ->
  $resource '/api/registrations/:id', id: '@id'
]
