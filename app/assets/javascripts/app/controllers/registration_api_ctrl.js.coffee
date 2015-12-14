angular.module('app.controllers')

.controller 'RegistrationApiCtrl', [
  '$scope'
  '$element'
  'Registration'
  'RegistrationApiFormResource'

($s, $element, Registration, RegistrationApiFormResource) ->
  $s.registrations = Registration.query()


  $s.update = (registration, _state) ->
    RegistrationApiFormResource.update id: registration.id,
    	registration:
      	state: _state
    , (success) ->
      $s.sent = true
    , (error) ->
      $s.error = true

]