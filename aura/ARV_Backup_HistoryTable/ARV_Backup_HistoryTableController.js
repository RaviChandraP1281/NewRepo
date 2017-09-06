({
    navigateToActivityObject : function(component, event, helper) {
        var evt = $A.get("e.force:navigateToComponent");
        var sfOrgId = component.get("v.sfOrgId");
        var backupActivityID = event.target.id;
        evt.setParams({
            componentDef: "c:ARV_Backup_ActivityObject",
            componentAttributes: {
                sfOrgId: sfOrgId,
                backupActivityID: backupActivityID
            }
        });
        evt.fire();   
        //var cmpEvent = component.getEvent("activityObjects");    
      	//cmpEvent.fire();
	}
})