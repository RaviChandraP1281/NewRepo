({
	doInit : function(component, event, helper) {
        helper.getSampleJSON(component);
	},
    
    getSampleJSON : function(component){
        var action = component.get("c.getOrgsList");
        action.setCallback(this, function(response) {
            this.doLayout(response, component);
        });
        $A.enqueueAction(action);
    },
    doLayout:function(response, component)
    {
  		  var jsonData = response.getReturnValue();
          component.set("v.orgData",jsonData);
           console.log(jsonData); 
 	}
})