#= require_self
#= require_tree ./app/directives/
#= require_tree ./app/controllers/
#= require_tree ./app/resources/
#= require_tree ./app/services/

app = angular.module('Funection', [
  'app.controllers'
  'app.directives'
  'app.resources'
  'app.services'
])

app.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

angular.module 'app.controllers', ['app.services', 'ngSanitize']
angular.module 'app.directives', ['ngAnimate']
angular.module 'app.resources', ['ngResource']
angular.module 'app.services', ['app.resources']

app.config ['$sceDelegateProvider', ($sceDelegateProvider) ->
  $sceDelegateProvider.resourceUrlWhitelist([
   'self',
  ])
]


window.relative_url_root = ''

