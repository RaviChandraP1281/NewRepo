({
	doInit : function(component, event, helper) {
        helper.getSampleJSON(component);
	},
    graphReload :  function(component){
      var sd = component.find("sd");
        sd.set("v.body",[]);
        $A.createComponent("c:DashboardBackupBarGraph",{},function(newButton, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = component.find("sd").get("v.body");
                    body.push(newButton);
                    component.find("sd").set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                    // Show error message
                }
            });
                              },
    getSampleJSON : function(component){
        var action = component.get("c.getBackupHistory");
        action.setParams({
            "top": 10
        });
        action.setCallback(this, function(response) {
            debugger;
            this.doLayout(response, component);
        });
        $A.enqueueAction(action);
    },
    doLayout:function(response, component)
    {
  		  var jsonData = JSON.parse(response.getReturnValue());
          component.set("v.gridData",jsonData);
            console.log(jsonData); 
 	}
})