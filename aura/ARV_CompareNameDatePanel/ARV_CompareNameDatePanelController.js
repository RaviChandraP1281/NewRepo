({
	searchBackups : function(component, event, helper) {
        component.set("v.fromDate", component.find("fromDate").get("v.value"));
        component.set("v.toDate", component.find("toDate").get("v.value"));        
		var compEvent = component.getEvent("showSnapshot");
        compEvent.fire();        
	}
})