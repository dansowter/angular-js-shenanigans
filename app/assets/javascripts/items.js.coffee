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

estimator = angular.module 'estimator', []

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
          estimates: []
        $scope.items.push item
        $scope.activeItem = item

    $scope.newItem = ""

  $scope.addEstimate = (item, effort) ->
    estimate =
      author: $scope.myName
      effort: effort
    item.estimates.push estimate
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
