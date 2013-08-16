var draw_treemap = function(root, target) {

  var margin = {bottom: 10},
      width = 960,
      height = 500 - margin.bottom;

  var treemap = d3.layout.treemap()
      .size([width, height])
      .sticky(true)
      .value(function(d) { return d.size; });

  var div = d3.select(target).append("div")
      .style("position", "relative")
      .style("width", (width) + "px")
      .style("height", (height + margin.bottom) + "px")
      .style("margin-left", "auto")
      .style("margin-right", "auto");

  var node = div.datum(root).selectAll(".node")
      .data(treemap.nodes)
      .enter().append("div")
      .attr("class", "node")
      .call(position)
      .style("background", function(d) { return d.name; })
      .text(function(d) { return d.name; });
}

function position() {
  this.style("left", function(d) { return d.x + "px"; })
      .style("top", function(d) { return d.y + "px"; })
      .style("width", function(d) { return Math.max(0, d.dx - 1) + "px"; })
      .style("height", function(d) { return Math.max(0, d.dy - 1) + "px"; });
}
