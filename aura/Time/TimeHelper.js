({
	loadMinutes : function(component, event, helper) {
		var getBObjects = component.get("c.getMinutes");
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();
        	//alert(bObjects); 
            component.set("v.minutesObj", bObjects);
        });
        $A.enqueueAction(getBObjects); 
	},
    loadHours : function(component, event, helper) {
		var getBObjects = component.get("c.getHours");
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();
        	//alert(bObjects); 
            component.set("v.hoursObj", bObjects);
        });
        $A.enqueueAction(getBObjects); 
	},
    loadDays : function(component, event, helper) {
		var getBObjects = component.get("c.getDays");
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();
        	//alert(bObjects); 
            component.set("v.datesObj", bObjects);
        });
        $A.enqueueAction(getBObjects); 
	}
})