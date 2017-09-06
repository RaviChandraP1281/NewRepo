({
	handleRemove : function(component, event, helper) {
        var label = event.getSource().get("v.label");
        var pills =component.get("v.pills");
        for(var i=0;i<pills.length;i++){
            if(pills[i] ==  label)
            {
               delete pills[i];
            }
        }
        component.set("v.pills", pills);   
	}
})