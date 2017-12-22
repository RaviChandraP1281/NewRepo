({
	ToggleCollapse : function(component, event, helper) { 
		helper.ToggleCollapseHandler(component, event);
	},
    navigateToActivityObject : function(component, event, helper) {
        var sfOrgId = component.get("v.sfOrgId");
        var backupActivityID = event.target.id;
        var cmpEvent = component.getEvent("activityObjects");   
        cmpEvent.setParams({
            "sfOrgId":sfOrgId,
            "backupActivityID":backupActivityID
        });
      	cmpEvent.fire();
	}
})