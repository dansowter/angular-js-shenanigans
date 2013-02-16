defaultItems = [
  "As an admin I want to CRUD locations",
  "As an admin I want to CRUD consultants",
  "As an admin I want to enter the scheduled locations of all consultants",
  "As a consultant I want to enter my scheduled locations",
  "As a client I want to see the scheduled locations of consultants",
  "As a consultant I want to register after receiving my invitation email",
  "As a consultant I want to sign in",
  "As a consultant I want to manage my information"
]

effortFor =
  '192': 0.5
  '49': 1
  '50': 2
  '51': 3
  '52': 4
  '53': 5

estimator = angular.module 'estimator', []

$(document).on "keydown", (e) ->
  if e.keyCode is 38
    scope = angular.element("#app").scope()
    scope.previousItem(scope.activeItem)
    scope.$apply()
  if e.keyCode is 40
    scope = angular.element("#app").scope()
    scope.nextItem(scope.activeItem)
    scope.$apply()
  if $("#newItemArea").is(":focus")
    if e.keyCode is 13
      e.preventDefault()
      $(':focus').submit()
  else
    if e.keyCode is 13
      e.preventDefault()
      $("#newItemArea").focus()
    if effortFor[e.keyCode]
      e.preventDefault()
      scope = angular.element("#app").scope()
      scope.addEstimate(scope.activeItem, effortFor[e.keyCode])
      scope.$apply()


estimator.controller 'ItemsCtrl', ($scope) ->
  $scope.items = []
  $scope.activeItem = null
  $scope.newItem = ""
  $scope.myName = "Dan"
  $scope.newItemEffort = null

  $scope.addItem = (text) ->
    descriptions = text.split "\n"

    for description in descriptions
      unless description == ""
        item = 
          description: description
          estimates: {}
        $scope.items.push item
        $scope.activeItem = item

    $scope.newItem = ""

  $scope.addEstimate = (item, effort) ->
    item.estimates[$scope.myName] = effort
    $scope.nextItem(item)

  $scope.nextItem = (item) ->
    i = $scope.items.indexOf item
    next = $scope.items[i + 1] || $scope.items[0]
    $scope.activeItem = next

  $scope.previousItem = (item) ->
    i = $scope.items.indexOf item
    previous = $scope.items[i - 1] || $scope.items[$scope.items.length - 1]
    $scope.activeItem = previous

  $scope.addItem item for item in defaultItems
