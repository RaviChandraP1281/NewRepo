({
  
    setSfOrgId: function(component,event,helper, isForceBackup){
       var sfOrgId =  component.get("v.sfOrgId");
       component.set("v.sfOrgId",sfOrgId);
       var cmpEvent = component.getEvent("orgIdChanged");
       cmpEvent.setParams({
           "sfOrgId": sfOrgId,
           "isForceBackup": isForceBackup
        });
       cmpEvent.fire();  
		},
     startBackup: function(component,event,helper){
          var action = component.get("c.startBackup");
          action.setParams({ 
            "sfOrgID" : component.get("v.sfOrgId"),
            "idUser" : component.get("v.idUser"),
            "backupType" :"forced",
            "bkpLabel" : component.find("bkpLabel").get("v.value")
         });
        action.setCallback(this, function(response) {
            this.startBackupResponse(response, event, component,helper);
        });
        $A.enqueueAction(action);
    },
     startBackupResponse:function(response, event,component,helper){
        var jsonData = response.getReturnValue();
        console.log(jsonData);
        helper.toastMsg("ForceBack up Initiated",jsonData);
        var a =true;
        helper.setSfOrgId(component, event, helper, a);
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
        //alert('in checkAttachment');
        var sfOrgId = component.get("v.sfOrgId");
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
        var sfOrgId = component.get("v.sfOrgId");
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
    },
    toastMsg :function(title, message){
          var toastEvent = $A.get("e.force:showToast");
               toastEvent.setParams({
                 "title": title,
                 "message": message
               });
               toastEvent.fire();
    }
  
})