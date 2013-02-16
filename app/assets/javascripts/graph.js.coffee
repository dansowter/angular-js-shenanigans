angular.module('estimator').directive('visualiseEstimates', [ -> 
      return {
        restrict: 'E',
        scope: { val: '=' },
        link: (scope, element, attrs) ->
          createSVG(scope, element)
          scope.$watch('val', updateGraph, true)
      }
  ])

createSVG = (scope, element) ->
  scope.width = 200
  scope.height = 200
  scope.innerRadius = 30
  scope.radius = 80
  
  scope.pie = d3.layout.pie()
    .value((d) -> d.effort)
    .sort(null)
  scope.color = d3.scale.category20()
  scope.arc = d3.svg.arc()
    .innerRadius(scope.innerRadius)
    .outerRadius(scope.radius)

  if not scope.svg?
    scope.svg = d3.select(element[0])
      .append("svg")
        .attr("width", scope.width)
        .attr("height", scope.height)
        .append('g')
          .attr('transform', 'translate(' + scope.width/2 + ',' + scope.height/2 + ')')

    
updateGraph = (newVal, oldVal, scope) ->
  arcTween = (a) -> 
    i = d3.interpolate(this._current || 0, a)
    this._current = i(0)
    (t) ->
      scope.arc(i(t))

  pieData = scope.pie(newVal)

  slices = scope.svg.selectAll('path.slice')
    .data(pieData)

  slices.enter()
    .append('path')
      .attr('class', 'slice')
      .attr('d', scope.arc )
      .attr 'fill', (d, i) ->
        scope.color(i)
      .each (d) ->
        @_current = d

  slices.transition().duration(750).attrTween("d", arcTween)

  slices.exit()
    .remove()  

