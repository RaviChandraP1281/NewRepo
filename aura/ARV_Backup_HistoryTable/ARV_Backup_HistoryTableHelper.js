({
	previewLog : function(component, event, helper) {
        debugger;
        var backupID = event.getSource().get("v.title");
        var action = component.get("c.getBackupsLog");
        action.setParams({ 
            "backupID": backupID
        });
        action.setCallback(this, function(response) {
            var rObjects = response.getReturnValue();
            component.set("v.previewLog", rObjects);
            component.set("v.isOpen", true);  
            helper.overrideHeaderStyle(component);
        });
        $A.enqueueAction(action); 
	},
    overrideHeaderStyle : function(component){
        component.set("v.cssStyle", ".forceStyle .viewport.oneHeader.desktop {z-index:0} .forceStyle.desktop .viewport{overflow:hidden}");
    },
    updatechart:function(component, event, helper) {
     var cmpEvent = component.getEvent("updatechart");   
     cmpEvent.fire();
	}
})