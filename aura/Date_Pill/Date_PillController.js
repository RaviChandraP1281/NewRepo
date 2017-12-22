({
	handleRemove : function(component, event, helper) {
        debugger;
        var label = event.getSource().get("v.label");
        var name = event.getSource().get("v.name");
        var pills =component.get("v.pills");
            if(pills[name] ==  label)
            {
                try
                {
               		pills.splice(name, 1);
                }
                catch(e)
                {
                    console.log("Error whilte killing pill");
                }
            }
        component.set("v.pills", pills);   
	}
})