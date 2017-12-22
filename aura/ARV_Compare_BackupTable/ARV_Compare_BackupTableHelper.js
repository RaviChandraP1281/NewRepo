({
	showNextSnapshot : function(component, event, helper, label, value) {
        component.set("v.firstSelectedSnapID", label);
        component.set("v.firstSnapshot", value);
        if(component.get("v.secondSelectedSnapID")!=''){
            component.set("v.countofSnapshots",3);
            component.set("v.radiobtnDisabled",true);
        }
        else
        {
            component.set("v.countofSnapshots",2);
        }
	//	var compEvent = component.getEvent("showNextSnapshot");
     //   compEvent.fire();        
    },
    showSnapshotOptions : function(component, event, helper, label, value) {
        component.set("v.secondSelectedSnapID", label);
        component.set("v.secondSnapshot", value);
        component.set("v.countofSnapshots",3);
        component.set("v.radiobtnDisabled",true);
        var compEvent = component.getEvent("showSnapshotOptions");
        compEvent.fire();
       
    }
})