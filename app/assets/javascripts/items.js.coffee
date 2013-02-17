estimator = angular.module 'estimator', ["ngResource"]

estimator.factory "Item", ["$resource", ($resource) ->
  $resource("/items/:id", {id: "@id"}, {update: {method: "PUT"}})
]

estimator.controller 'ItemsCtrl', ($scope, Item) ->
  $scope.items = Item.get()
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
        Item.save(item)
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
