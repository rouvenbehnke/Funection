angular.module('app.controllers')

.controller 'FormCtrl', [
  '$scope'
  '$element'
  'RegistrationFormResource'

($s, $element, RegistrationFormResource) ->
  $s.formId = $element.data('form-id')
  $s.formValues = {}
  $s.acqus = $element.data('knows')
  $s.marital_status = $element.data('marital')

  $s.$watch 'marital_statuus', () ->
    if $s.marital_statuus == "Einzelperson"
      $s.formValues.persons = 1
    if $s.marital_statuus == "Ehepaar"
      $s.formValues.persons = 2
    if $s.marital_statuus == "Familie"
      $s.formValues.persons = ""





  $s.send = () ->
    $s.sent = false
    $s.error = false

    RegistrationFormResource.create form_id: $s.formId,
      form_values: $s.formValues
    , (success) ->
      $s.sent = true
      $s.formValues = ""
      $s.marital_statuus = null
    , (error) ->
      $s.error = true
]
