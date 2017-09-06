({
	btnClick : function(component, event, helper) {
		var compEvent = component.getEvent("btnClickEvent_Junk");
        compEvent.setParams({
            "context":"leela" 
        });
		compEvent.fire();
	}
})