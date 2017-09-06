({
	doInit : function(component, event, helper) {
        var action = component.get("c.getFObjectsPerBackup");
        action.setParams({ "sfOrgID" : "00D6F000001OOISUA4", "backupID": "1001"});
		action.setCallback(this, function(response) {
            component.set("v.objects",response.getReturnValue());
             window.setTimeout(
                $A.getCallback(function() {
            			helper.displayFreqOptions(component, event, helper);
                }));
        });
        $A.enqueueAction(action);

	},
    displayFreqOptions : function(component, event, helper) {
       helper.displayFreqOptions(component, event, helper);
    }
})