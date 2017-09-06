({
	doInit : function(component, event, helper) {
        helper.getSampleJSON(component);
	},
    getSampleJSON : function(component){
        var action = component.get("c.basicAuthCallout");
        action.setParams({ 
            "orgName" : component.get("v.orgtitle"),
            "userName" : component.get("v.username"),
            "pwd" : ''+component.get("v.password")+''+component.get("v.securityToken")
         });

        action.setCallback(this, function(response) {
            this.doLayout(response, component);
        });
        $A.enqueueAction(action);
    },
    doLayout:function(response, component)
    {
  		  var jsonData = response.getReturnValue();
          component.set("v.orgData",jsonData);
        //write if sucess message 
 	}
})