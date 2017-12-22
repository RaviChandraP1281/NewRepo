({
	btnClick : function(component, event, helper) {
        var ind =component.find("ind");
        debugger;
        alert(ind.get("v.value"));
        component.set("v.name","Submit");
		/*var compEvent = component.getEvent("btnClickEvent_Junk");
        compEvent.setParams({
            "context":"leela" 
        });
		compEvent.fire();*/
	}
})