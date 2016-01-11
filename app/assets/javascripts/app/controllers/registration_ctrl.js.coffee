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
  $s.parts = $element.data('partselection')

  $s.$watch 'marital_statuus', () ->
    if $s.marital_statuus == "Einzelperson"
      $s.formValues.persons = 1
    if $s.marital_statuus == "Ehepaar"
      $s.formValues.persons = 2
    if $s.marital_statuus == "Familie"
      $s.formValues.persons = ""

  $s.showSelectValue = (acqucollector) ->
    if acqucollector == "ja"
      $s.formValues.acqu = 0
    if acqucollector == "nein"
      $s.formValues.acqu = 1
    $s.formValues.acqu

  $s.partselection_eval = (partcollector) ->
    if partcollector == "Part1(Partnertanz)"
      $s.formValues.parts = 0
    if partcollector == "Part2(Freestyle)"
      $s.formValues.parts = 1
    if partcollector == "Part1 & Part2"
      $s.formValues.parts = 2
    $s.formValues.parts

  $s.send = () ->
    $s.sent = false
    $s.error = false

    RegistrationFormResource.create form_id: $s.formId,
      form_values: $s.formValues
    , (success) ->
      $s.sent = true
      $s.marital_statuus = null
    , (error) ->
      $s.error = true
]