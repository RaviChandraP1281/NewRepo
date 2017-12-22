({
	backToDashboard : function(component, event, helper) {
		var cmpEvent = component.getEvent("returnToDashboard");   
       	cmpEvent.fire();
	}
})