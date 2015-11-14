angular.module('app.controllers')

.controller 'FormCtrl', [
  '$scope'
  '$element'
  'RegistrationFormResource'

($s, $element, RegistrationFormResource) ->
  $s.formId = $element.data('form-id')
  $s.formValues = {}
  $s.acqus = $element.data('topics')

  $s.send = () ->
    $s.sent = false
    $s.error = false

    RegistrationFormResource.create form_id: $s.formId,
      form_values: $s.formValues
    , (success) ->
      $s.sent = true
    , (error) ->
      $s.error = true
]
