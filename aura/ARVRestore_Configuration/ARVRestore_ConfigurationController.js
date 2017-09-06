({
	confirmRestore : function(component, event, helper) {
		/*var backupIDs = component.get("v.backupIDs");
        var recordIDs = component.get("v.recordIDs");
        var sfOrgID = "00D6F000001OOISUA4";//component.get("v.sfOrgId");
        
        alert(backupIDs+':'+recordIDs);
        var restoreReq = component.get("c.submitRestoreRequest");
        restoreReq.setParams({ "sfOrgID" : sfOrgID, 
                                "backupIDs" : backupIDs, 
                                "recordIDs": recordIDs});
        restoreReq.setCallback(this, function(a) {
            var confirmRestore = a.getReturnValue();  
            alert('confirmRestore:'+confirmRestore);
        });
                               
        $A.enqueueAction(restoreReq); */
        debugger;
        var cmpEvent = component.getEvent("confirmRestore");
        cmpEvent.fire();   
    
	}
})