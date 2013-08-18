var draw_treemap = function(root, target, width, height, show_detail) {

  var width = typeof width !== 'undefined' ? width : 960,
      height = typeof height !== 'undefined' ? height : 500,
      show_detail = typeof show_detail !== 'undefined' ? show_detail : true;

  var treemap = d3.layout.treemap()
      .size([width, height])
      .sticky(true)
      .sort(function(a,b){ return a.size - b.size; })
      .value(function(d) { return d.size; });

  var div = d3.select(target).append("div")
      .style("position", "relative")
      .style("width", width + "px")
      .style("height", height + "px")
      .style("margin-left", "auto")
      .style("margin-right", "auto");

  var node = div.datum(root).selectAll(".node")
      .data(treemap.nodes)
      .enter().append("div")
      .attr("class", "node")
      .call(position)
      .style("background", function(d) { return d.name; })
      .text(function(d) { if(show_detail == true ) {return d.name}; });
}

function position() {
  this.style("left", function(d) { return d.x + "px"; })
      .style("top", function(d) { return d.y + "px"; })
      .style("width", function(d) { return Math.max(0, d.dx - 1) + "px"; })
      .style("height", function(d) { return Math.max(0, d.dy - 1) + "px"; });
}
