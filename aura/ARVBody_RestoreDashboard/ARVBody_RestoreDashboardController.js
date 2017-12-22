({
	showThisRestore : function(component, event, helper) {
        alert("dddddd");
        debugger;
            component.find("bodyfill").set("v.body", []);
            var destination ="c:ARVSelectBackup_Restore";
            $A.createComponent(
                "c:ARVSelectBackup_Restore",
                {
                    
                },
                function(newButton){
                    debugger;
                    //Add the new button to the body array
                    if (component.isValid()) 
                    {
                        debugger;
                        var body = component.find("bodyfill").get("v.body");
                        body.push(newButton);
                        component.find("bodyfill").set("v.body", body);
                    }
                }
            );

	},
    showGraph : function(component, event, helper) {
       //helper.graphReload(component);
       debugger;
       var graph= component.find("bargraph");
       $A.util.toggleClass(graph, "slds-hide");
        
    }
})