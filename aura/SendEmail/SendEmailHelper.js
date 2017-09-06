({
    checkAttachment: function(component) {
        var action = component.get("c.isEmailAttachment");
        var sfOrgId = component.get("v.sfOrgId");
		var dataObjects = component.get("v.dataObjects");        
        action.setParams({
            'sfOrgId': sfOrgId,
            'objects': dataObjects
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var attachExists = response.getReturnValue();
                alert(attachExists);
                if(attachExists){
                    var toggleText = component.find("attachmentFile");
        			$A.util.toggleClass(toggleText, "toggle");
                }
                component.set("v.isAttachment", response.getReturnValue());
                // for Display Model,set the "isOpen" attribute to "true"
      			component.set("v.isOpen", true);
            }
        });
        $A.enqueueAction(action);
    },
    sendHelper: function(component, getEmail) { 
        // call the server side controller method 	
        var action = component.get("c.sendMailMethod");
        // set the 3 params to sendMailMethod method   
        action.setParams({
            'mMail': getEmail 
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                component.set("v.isOpen", false);
            }
 
        });
        $A.enqueueAction(action);
    }
})