({
	doInit : function(component, event, helper) {
        let sucess = component.get("v.successcount");
        let total = component.get("v.records");
		if(sucess==undefined || sucess==null)
            sucess =0;
        if(total==undefined || total==null)
            sucess =0;
        var percent = (sucess*100)/total;
        var a = component.find("comp").getElement();
		var svg  = d3.select(a)
            .append("svg")
            .attr("width", 100)
            .attr("height", 10)
            .attr("fill",  "#fff")
            .append("rect")
            .attr("x", "0")
            .attr("y", "0")
            .attr("width", ""+percent)
            .attr("height", "10")
            .attr("fill", function(d) { return "#49a5dd"; });
	}
})