({
	loadMinutes : function(component, event, helper) {
		helper.loadDays(component, event, helper);
        helper.loadHours(component, event, helper);
        helper.loadMinutes(component, event, helper);
	},
    saveInfo : function(component, event, helper) {
		var time = component.find("time").get("v.value");
        var ampm = component.find("ampm").get("v.value");
        var dates = component.find("dates").get("v.value");
        var minutes = component.find("minutes").get("v.value");
        var getBObjects = component.get("c.getTimeStamp");
        getBObjects.setParams({ 
            "dateStr":dates, 
            "timeStr":time, 
            "minuteStr": minutes, 
            "ampm":ampm
        });            
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();
        	alert(bObjects); 
        });
                               
        $A.enqueueAction(getBObjects); 
	}
})