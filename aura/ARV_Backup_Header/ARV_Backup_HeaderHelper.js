({
     startBackup: function(component,event,helper){
          var action = component.get("c.startBackup");
          action.setParams({ 
            "sfOrgID" : component.get("v.sfOrgId")
         });
        action.setCallback(this, function(response) {
            this.startBackupResponse(response, component);
        });
        $A.enqueueAction(action);
    },
     startBackupResponse:function(response, component){
        var jsonData = response.getReturnValue();
        console.log(jsonData);
          var toastEvent = $A.get("e.force:showToast");
               toastEvent.setParams({
                 "title": "Force Backup Status",
                 "message": jsonData
               });
               toastEvent.fire();
	},
     showPopupHelper: function(component, componentId, className){
        var modal = component.find(componentId);
        $A.util.removeClass(modal, className + 'hide');
        $A.util.addClass(modal, className + 'open');
    },
     hidePopupHelper: function(component, componentId, className){
        var modal = component.find(componentId);
        $A.util.addClass(modal, className+'hide');
        $A.util.removeClass(modal, className+'open');
        component.set("v.body", "");
    },
     checkAttachment: function(component) {
        alert('in checkAttachment');
        var sfOrgId = '00D6F000001OOISUA4';//component.get("v.sfOrgId");
		var dataObjects = JSON.stringify(component.get("v.backupObjects"));
        var action = component.get("c.isEmailAttachment");
        action.setParams({
            "sfOrgId": sfOrgId,
            "objects": dataObjects,
            "subject": "Backup" 
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var attachExists = response.getReturnValue();
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
     sendEmailHelper: function(component, getEmail) { 
        // call the server side controller method 	
        var action = component.get("c.sendEmailNotification");
        var objects = JSON.stringify(component.get("v.backupObjects"));
        var sfOrgId = '00D6F000001OOISUA4';//component.get("v.sfOrgId");
        var getEmail = component.get("v.email");
        // set the 3 params to sendMailMethod method   
        action.setParams({
            "sfOrgId": sfOrgId,
            "objects": objects, 
            "mMail": getEmail,
            "subject": "Backup Activity" 
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