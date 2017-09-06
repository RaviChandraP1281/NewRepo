({
	doLoadActivityObject : function(component, event, helper) {
		var sfOrgID = component.get("v.sfOrgId");
        var backupID = component.get("v.backupActivityID");
	    var action = component.get("c.getBackupObject");
          action.setParams({ 
            "sfOrgID" : sfOrgID,
              "backupID": backupID
         });
        action.setCallback(this, function(response) {
            component.set("v.backupObject",response.getReturnValue());
            var jsonData = response.getReturnValue();
            var objectArray = [];
            objectArray = JSON.stringify(jsonData.resultCriteria);
            component.set("v.resultCriteria",objectArray);
            
        });
        $A.enqueueAction(action);
    }    
})