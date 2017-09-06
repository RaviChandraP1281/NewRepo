({
	getSnapshotsData : function(component, event, helper) {
        
		var action = component.get("c.getDataFromSnapshotID");
          var idUser = ''
          action.setParams({ 
            "sfOrgID" : component.get("v.sfOrgId"),
            "snapshotID" : component.get("v.snapshotID"),
              
         });
        
        action.setCallback(this, function(response) {
             component.set("v.snapshotDetails",response.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})