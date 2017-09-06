({
	doInit : function(component, event, helper) {
        helper.getSampleJSON(component);
	},
    getSampleJSON : function(component){
        var action = component.get("c.basicAuthCallout");
        action.setParams({ 
            "orgName" : component.find("orgtitle").get("v.value"),
            "userName" :component.find("username").get("v.value"),
            "pwd" : ''+ component.find("password").get("v.value")+''+component.find("securityToken").get("v.value")
         });

        action.setCallback(this, function(response) {
            this.doLayout(response, component);
        });
        $A.enqueueAction(action);
    },
    doLayout:function(response, component)
    {
  		  var jsonData = response.getReturnValue();
        //  component.set("v.orgData",jsonData);
        //write if sucess message 
 	}
})