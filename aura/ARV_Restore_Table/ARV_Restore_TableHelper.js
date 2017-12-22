({
		previewLog : function(component, event, helper) {
        debugger;
        var restoreID = event.getSource().get("v.value");
		var action = component.get("c.getBackupsLog");
        action.setParams({ 
            "backupID": restoreID
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
       // component.set("v.cssStyle", ".forceStyle .viewport.oneHeader.desktop {z-index:0} .forceStyle.desktop .viewport{overflow:hidden}");
    }
})