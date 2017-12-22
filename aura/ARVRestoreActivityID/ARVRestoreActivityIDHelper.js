({
    getRestoreActivity : function(component) {
    	var sfOrgID = component.get("v.sfOrgId"); // "00D6F000001OOISUA4"; //
        var action = component.get("c.getRestores");
        action.setParams({ "sfOrgID" : sfOrgID});
		action.setCallback(this, function(response) {
            component.set("v.restoreObjects",response.getReturnValue());            
        });
        $A.enqueueAction(action);
    }
})