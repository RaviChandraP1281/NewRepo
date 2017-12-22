({	
    doInit : function(component, event, helper) {
       
       helper.getSnapshotsList(component, event, helper); 
            
    },
	enableButton : function(component, event, helper) {
        var label = event.target.getAttribute("value");
        component.set("v.radioLabelSelected", label);
        var btn = component.find("nextBtn");
    	btn.set("v.disabled",false);   
        var btn = component.find("compareBtn");
    	btn.set("v.disabled",false);
	},
    showNextSnapshot : function(component, event, helper) {
        var compEvent = component.getEvent("showNextSnapshot");
        component.set("v.firstSelectedSnapID", component.get("v.radioLabelSelected"));
		compEvent.fire();
    },
    showSnapshotOptions : function(component, event, helper) {
    	var compEvent = component.getEvent("showSnapshotOptions");
        component.set("v.secondSelectedSnapID", component.get("v.radioLabelSelected"));
		compEvent.fire();
    }
})