({
	doInit : function(component, event, helper) {
        helper.getSampleJSON(component);
	},
    
    getSampleJSON : function(component){
        var action = component.get("c.getSfFields");
         action.setParams({ 
            "sfOrgID" : "00D6F000001OOISUA4",
             "sfObjName":"Account"
         });
        action.setCallback(this, function(response) {
            this.doLayout(response, component);
        });
        $A.enqueueAction(action);
    },
    doLayout:function(response, component)
    {
        alert('fields:'+response.getReturnValue());  
        var jsonData = response.getReturnValue();
        component.set("v.fieldData",jsonData);
        console.log(jsonData); 
 	}
})