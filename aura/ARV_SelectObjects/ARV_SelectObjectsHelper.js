({
	doInit : function(component, event, helper) {
        helper.getSampleJSON(component);
	},
    
    getSampleJSON : function(component){
        var action = component.get("c.getsObjectsList");
        action.setCallback(this, function(response) {
            this.doLayout(response, component);
        });
        $A.enqueueAction(action);
    },
    doLayout:function(response, component)
    {
        alert('doLayout:ret:'+response.getReturnValue());  
        var jsonData = JSON.parse(response.getReturnValue());
          component.set("v.objectData",jsonData);
           console.log(jsonData); 
 	}
})