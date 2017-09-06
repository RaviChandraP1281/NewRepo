({
	helperMethod : function(component) {
      
        var data =[
            {"Org" : "Dev1", "sucess": 1900, "failed":1200},
             {"Org" : "Dev2", "sucess": 1000, "failed":120},
             {"Org" : "QA1", "sucess": 10000, "failed":12000},
             {"Org" : "QA2", "sucess": 2404, "failed":3545},
             {"Org" : "Integration", "sucess": 35555, "failed":1200},
             {"Org" : "Production", "sucess": 5555, "failed":2333},
             {"Org" : "STG1", "sucess": 43564, "failed":2222},
             {"Org" : "STG2", "sucess": 19000, "failed":1200},
             {"Org" : "Dev3", "sucess": 9999, "failed":1200}   
];
        
   var a = component.find("csv").getElement();
   var  margin = {top: 20, right: 20, bottom: 30, left: 50},
    width = a.offsetWidth,
    height = 400;
        debugger;
		var svg  = d3.select(a)
            .append("div")
  		    .classed("svg-container", true) 
            .append("svg")
            .attr("preserveAspectRatio", "xMinYMin meet")
   			.attr("viewBox", "0 0 "+(width-100)+" "+(height+50))
  			.classed("svg-content-responsive", true)
            .attr("id", "chart")
            .attr("width", width)
            .attr("height", height);

var x = d3.scaleBand().rangeRound([0, width]).padding(0.1),
    y = d3.scaleLinear().rangeRound([height, 0]);
  
var colours = d3.scaleOrdinal()
    .range(["#6F257F", "#CA0D59","#235322", "#CAffff","#6F6666", "#D59D59","#6F6F6F", "#0D5CA9","#CACACA", "#A0A0A0","#7F7F7F", "#0D0D59","#25257F", "#A0D559","#57F6F2", "#0DCA59"]);

var g = svg.append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


    x.domain(data.map(function(d) { return d.Org; }));
    y.domain([0, d3.max(data, function(d) { return d.sucess; })]);

    g.append("g")
        .attr("class", "axis axis--x")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x));

    g.append("g")
      	.attr("class", "axis axis--y")
      	.call(d3.axisLeft(y).ticks(5).tickFormat(function(d) { return parseInt(d / 1000) + "K"; }).tickSizeInner([-width]))
      .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", "0.71em")
        .attr("text-anchor", "end")
        .attr("fill", "#5D6971")
        .text("ddddddd");

    g.selectAll(".bar")
      	.data(data)
      .enter().append("rect")
        .attr("x", function(d) { return x(d.Org); })
        .attr("y", function(d) { return y(d.sucess); })
        .attr("width", x.bandwidth())
        .attr("height", function(d) { return height - y(d.sucess); })
        .attr("fill", function(d) { return "#0DCCFF"; })
        .on("mousemove", function(d){
          
        })
    		.on("mouseout", function(d){});
 

	}
})