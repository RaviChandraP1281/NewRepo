({
	displayFreqOptions : function(component, event, helper) {
        debugger;
        var id = component.find("objects").get("v.value");
        var a = component.get("v.objects");
        var isEmpty = $A.util.isEmpty(id); 
        if(!isEmpty){
            component.set("v.fields", a[id].fields);
        }        
    }
})