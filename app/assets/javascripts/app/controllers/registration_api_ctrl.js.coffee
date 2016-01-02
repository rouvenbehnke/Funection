angular.module('app.controllers')

.controller 'RegistrationApiCtrl', [
  '$scope'
  '$element'
  'Registration'
  'RegistrationApiFormResource'

($s, $element, Registration, RegistrationApiFormResource) ->
  $s.registrations = Registration.query()

  $s.registration_persons_created = 0
  $s.registration_persons_confirmed = 0
  $s.registration_persons_declined = 0
  $s.registration_persons_accepted = 0
  $s.registration_persons_reserved = 0

  registrations = Registration.query().$promise.then (registrations) ->
    angular.forEach registrations, (registration) ->
      if registration.persons > 0 && registration.state == "confirmed"
        $s.registration_persons_confirmed = $s.registration_persons_confirmed + registration.persons
      if registration.persons > 0 && registration.state == "declined"
        $s.registration_persons_declined = $s.registration_persons_declined + registration.persons
      if registration.persons > 0 && registration.state == "accepted"
        $s.registration_persons_accepted = $s.registration_persons_accepted + registration.persons
      if registration.persons > 0 && registration.state == "reserved"
        $s.registration_persons_reserved = $s.registration_persons_reserved + registration.persons


  $s.colorize = (registration) ->
    if registration.state == "created"
      $s.color = {'background' : 'lightgray'}
    if registration.state == "confirmed"
      $s.color = {'background' : 'yellow'}
    if registration.state == "accepted"
      $s.color = {'background' : 'palegreen'}
    if registration.state == "declined"
      $s.color = {'background' : 'indianred'}
    if registration.state == "reserved"
      $s.color = {'background' : 'aquamarine'}
    $s.color

  $s.update = (registration, _state) ->
    RegistrationApiFormResource.update id: registration.id,
    	registration:
      	state: _state
    , (success) ->
      $s.registrations = Registration.query()
      registrations
      $s.sent = true
    , (error) ->
      $s.error = true

]
