effortFor =
  '192': 0.5
  '49': 1
  '50': 2
  '51': 3
  '52': 4
  '53': 5

$(document).on "keydown", (e) ->
  if e.keyCode is 38
    e.preventDefault()
    scope = angular.element("#app").scope()
    scope.previousItem(scope.activeItem)
    scope.$apply()
  if e.keyCode is 40
    e.preventDefault()
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
