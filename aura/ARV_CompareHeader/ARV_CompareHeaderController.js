({
     doInit : function(component, event, helper) {
         helper.getOrgsList(component, event, helper);
         
    },
     showMenu : function(component, event, helper) {
		var show = component.find("SelectOrgDropdown");
        $A.util.removeClass(show,'slds-hide');
           
	},
    selectOrgValue : function(component, event, helper) {
        debugger;
    	var id = event.target.getAttribute("title");
        component.set("v.sfOrgId", id);
        var id = event.target.getAttribute("id");
        component.set("v.orgValue", id);
        var compEvent = component.getEvent("showSnapshot");
		compEvent.fire();
        component.set("v.snapshotHeader", "Snapshot 1");
        helper.hidehover(component, event);
    }
})