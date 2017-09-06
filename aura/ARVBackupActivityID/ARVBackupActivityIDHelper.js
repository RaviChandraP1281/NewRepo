({
	getSnapshotsList : function(component, event, helper) {
    	var action = component.get("c.getListOfSnapshots");
    	var sfOrgID = '';
    	action.setParams({ 
            "sfOrgID" : component.get("v.sfOrgId"),
         });
        action.setCallback(this, function(response) {
            component.set("v.snapshotData",response.getReturnValue());
            
        });
        $A.enqueueAction(action);
        
	}
})