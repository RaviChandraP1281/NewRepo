({
	getOrgByOrgId : function(component, event, helper) {
        var sfOrgID = event.target.getAttribute("title");
        helper.getOrgByOrgService(component, sfOrgID);
	},
    getOrgByOrgService : function(component, sfOrgID){
        var action = component.get("c.getOrgsDetails");
         action.setParams({ 
            "sfOrgId" : sfOrgID,
            "isExistedOrg":"true"
         });
        action.setCallback(this, function(response) {
            this.getOrgDetails(response, component);
        });
        $A.enqueueAction(action);
    },
    getOrgDetails: function(response, component){
        var jsonData = response.getReturnValue();
        var cmpEvent = component.getEvent("getOrgDetails");
        cmpEvent.setParams({
            "orgDetails":jsonData 
        });
        cmpEvent.fire();
    }
})