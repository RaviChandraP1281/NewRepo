({
	doInit : function(component, event, helper) {
        var a = component.find("comp").getElement();
		var svg  = d3.select(a)
            .append("svg")
            .attr("width", 100)
            .attr("height", 10)
         .attr("fill", function(d) { return "#fff"; })
            .append("rect")
            .attr("x", "0")
            .attr("y", "0")
            .attr("width", ""+component.get("v.val"))
            .attr("height", "10")
        .attr("fill", function(d) { return "#49a5dd"; });
	}
})