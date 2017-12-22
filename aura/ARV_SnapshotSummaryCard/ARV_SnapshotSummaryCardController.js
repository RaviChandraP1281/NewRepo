({
	compareSnapshots : function(component, event, helper) {
        
       	var compEvent = component.getEvent("compareSnapshot");
        compEvent.fire();  
		
	}
})