({
        oAuthChange: function(component, event, helper) { //add slds-hide on standarddepends
        debugger;
        component.set("v.isOAuth", true);
        var oauthdepends = component.find("oauthdepends");
        $A.util.removeClass(oauthdepends,"slds-hide");
        var standarddepends = component.find("standarddepends");
		$A.util.addClass(standarddepends,"slds-hide");
        
	},
    authAccordinClose: function(component, event, helper) {
        let authAccordin = component.find("authAccordin");
        $A.util.removeClass(authAccordin, "slds-is-open");
         let authAcrnDiv = component.find("authAcrnDiv");
        $A.util.addClass(authAcrnDiv, "slds-hide");
    },
     authAccordinOpen: function(component, event, helper) {
        let authAccordin = component.find("authAccordin");
        $A.util.addClass(authAccordin, "slds-is-open");
         let authAcrnDiv = component.find("authAcrnDiv");
        $A.util.removeClass(authAcrnDiv, "slds-hide");
    },
    stdChange: function(component, event, helper) { //remove slds-hide on standarddepends
        debugger;
         component.set("v.isOAuth", false);
        var standarddepends = component.find("standarddepends");
        $A.util.removeClass(standarddepends,"slds-hide");
        var oauthdepends = component.find("oauthdepends");
        $A.util.addClass(oauthdepends,"slds-hide");
        
	},
	saveOrUpdateOrg : function(component, event, helper, orgId, isfetchObjects) {
        if(orgId!="" && orgId!=undefined && orgId!=null)
        {
           helper.updateOrg(component, event, helper, orgId, isfetchObjects);
        }
        else{
        	helper.newOrg(component, event, helper);
        }
	},
    newOrg : function(component, event, helper){
        var action = component.get("c.basicAuthCallout");
        action.setParams({ 
            "orgName" : component.find("orgtitle").get("v.value"),
            "userName" :component.find("username").get("v.value"),
            "pwd" : ''+ component.find("password").get("v.value"),
            "sfSecToken" :''+component.find("securityToken").get("v.value"),
            "idUser": component.get("v.idUser")
        });
debugger;
        action.setCallback(this, function(response) {
            this.saveNewOrgResponse(response, component, helper);
        });
        $A.enqueueAction(action);
    },
    saveNewOrgResponse:function(response, component, helper)
    {
          var state = response.getState();
            if (state === "SUCCESS") {
  		      var jsonData = response.getReturnValue();
              component.set("v.sforgIdAfterSaveOrUpdate", jsonData);
              helper.toastMsg("Authentication","Org saved sucessfully.", "success");
                var orgId = jsonData;
               // helper.afterOrgSaved(component, orgId);
               component.set("v.sforgIdAfterSaveOrUpdate", orgId);
               component.set("v.isgetFetchObjects", true);	
            }
            else{
                 helper.authAccordinOpen(component, event, helper);
                helper.toastMsg("Authentication","Failed to authenticate Salesforce org","error");
            }
 	},
    updateOrg : function(component, event, helper, orgId,isfetchObjects){
        debugger;
        var action = component.get("c.updateSfOrg");
        var a ={ 
            "idSforg" : orgId,
            "nmLable" : component.find("orgtitle").get("v.value"),
            "sfNmUser" :component.find("username").get("v.value"),
            "sfTxPwd" : ''+ component.find("password").get("v.value"),
            "sfSecToken" : ''+component.find("securityToken").get("v.value"),
            "idUser": ''+component.get("v.idUser")
        };
       var oauthType = component.find("oauthCon").get("v.checked");
        var authType = 'standard';
        if(oauthType){
            authType = "oauth";
        }
        action.setParams({ 
            "idSforg" : orgId,
            "nmLable" : component.find("orgtitle").get("v.value"),
            "sfNmUser" :component.find("username").get("v.value"),
            "sfTxPwd" : ''+ component.find("password").get("v.value"),
            "sfSecToken" : ''+component.find("securityToken").get("v.value"),
            "idUser": ''+component.get("v.idUser"),
            "accessToken":'',
            "sfAuthType":authType,
            "instanceURL":''+component.find("loginUrl").get("v.value"),
           
        });
        action.setCallback(this, function(response) {
            this.updateOrgResponse(response, component, helper, orgId, isfetchObjects);
        });
        $A.enqueueAction(action);
    },
    updateOrgResponse:function(response, component, helper, orgId, isfetchObjects)
    {
          var state = response.getState();
            if (state === "SUCCESS") {
              component.set("v.sforgIdAfterSaveOrUpdate", orgId);
  		      var jsonData = response.getReturnValue();
               helper.toastMsg("Authentication","Org details updated", "success");
              //  var orgId = jsonData;
               // helper.afterOrgSaved(component, orgId);
               component.set("v.sforgIdAfterSaveOrUpdate", orgId);
               component.set("v.isgetFetchObjects", true);	
                if(isfetchObjects){
                   helper.afterOrgSaved(component,orgId, isfetchObjects);
                }
            }
            else{
                helper.authAccordinOpen(component, event, helper);
               helper.toastMsg("Authentication","Failed to authenticate Salesforce org. Please reachout to support@arvault.com", "warning");
            }
 	},
    afterOrgSaved:function(component, orgId, isfetchObjects){
       
        debugger;
              if( orgId!= undefined && orgId!="")
              {
                 var cmpEvent = component.getEvent("sforgauthsucess");
                 cmpEvent.setParams({
                  "sfOrgID" : orgId,
                   "isExistedBackupCfg": isfetchObjects
                  });
                    cmpEvent.fire();   
              }
    },
    testExistingConnection : function(component, event, helper, isfetchObjects){
        var org = component.get("v.Org");
        let orgId = org.idSforg;
        var action = component.get("c.testSfConnection");
        action.setParams({ 
            "sfOrgID" : orgId
         });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            //alert('testConnection:'+JSON.stringify(response.getReturnValue()));
            if (state === "SUCCESS") {
				if (response.getReturnValue() === "Success") {
                        var cmpEvent = component.getEvent("sforgauthsucess");
                        cmpEvent.setParams({
                      "sfOrgID" : orgId,
                       "isExistedBackupCfg": isfetchObjects
                      });
                        cmpEvent.fire();                  
                }
                else
                {
                    helper.authAccordinOpen(component, event, helper);
                   helper.toastMsg("Authentication","Failed to authenticate Salesforce org", "error");
                }
            }
            else{
                helper.authAccordinOpen(component, event, helper);
               helper.toastMsg("Authentication","Failed to authenticate Salesforce org. Please reachout to support@arvault.com", "warning");
            }
        });
        $A.enqueueAction(action);
    },
    testConnection : function(component, event, helper, isSave, isfetchObjects){
        debugger;
        var username = component.find("username").get("v.value");
        var password = component.find("password").get("v.value");
        var secToken = component.find("securityToken").get("v.value");
        var instanceURL = component.find("loginUrl").get("v.value");
        var oauthType = component.find("oauthCon").get("v.checked");
        var stdType = component.find("standardCon").get("v.checked");
        var authType = 'standard';
        if(oauthType){
            authType = "oauth";
        }
        debugger;
        var action = component.get("c.testNewSfConnection");
        action.setParams({ 
            "userName" : username,
            "password" : password,
            "secToken": secToken,
            "authType": authType,
            "instanceURL" : instanceURL
         });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
				if (response.getReturnValue() === "Success") {
                    if(isSave){
                            var org = component.get("v.Org");
                            let orgId = org.idSforg;
                        debugger;
                            helper.saveOrUpdateOrg(component, event, helper, orgId, isfetchObjects);
                       }
                        else{
                  			helper.toastMsg("Authentication","Test Connection Sucessful");                  
                        }
                }
                else
                {
                    helper.authAccordinOpen(component, event, helper);
                   helper.toastMsg("Authentication","Failed to authenticate Salesforce org", "error");
                }
            }
            else{
                helper.authAccordinOpen(component, event, helper);
               helper.toastMsg("Authentication","Failed to authenticate Salesforce org. Please reachout to support@arvault.com", "warning");
            }
        });
        $A.enqueueAction(action);
    },    
    toastMsg:function(title, message, type){
         var toastEvent = $A.get("e.force:showToast");
               toastEvent.setParams({
                 "title": title,
                 "message": message,
                 "type":type
               });
               toastEvent.fire();
	}
})