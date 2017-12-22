({
    doInit: function(component, event, helper) {
        
    },
    authAccordinToggle: function(component, event, helper) {
        let authAccordin = component.find("authAccordin");
        $A.util.toggleClass(authAccordin, "slds-is-open");
         let authAcrnDiv = component.find("authAcrnDiv");
        $A.util.toggleClass(authAcrnDiv, "slds-hide");
    },
     authAccordinOpen: function(component, event, helper) {
        let authAccordin = component.find("authAccordin");
        $A.util.addClass(authAccordin, "slds-is-open");
         let authAcrnDiv = component.find("authAcrnDiv");
        $A.util.removeClass(authAcrnDiv, "slds-hide");
    },
    displayUrlFill : function(component, event, helper) {
         if(component.find("loginUrlType").get("v.value") === "production"){ 
             component.find("loginUrl").set("v.disabled","true");
             component.set("v.urlFill", "https://login.salesforce.com");
             component.set("v.isDisabled", true);
         }
        if(component.find("loginUrlType").get("v.value") === "qa"){ 
            component.find("loginUrl").set("v.disabled","true");
            component.set("v.urlFill", "https://test.salesforce.com");
            component.set("v.isDisabled", true);
        }
        if(component.find("loginUrlType").get("v.value") === "sandbox"){ 
            component.find("loginUrl").set("v.disabled","true");
        	component.set("v.urlFill", "https://test.salesforce.com");	
            component.set("v.isDisabled", true);
        }
        if(component.find("loginUrlType").get("v.value") === "customUrl"){ 
            var custom = component.find("loginUrl");
       	    $A.util.removeClass(custom,"v.disabled");
            component.set("v.urlFill", " ");
            component.set("v.isDisabled", false);
        }
		
	},
    clickAuthenticate: function(component, event, helper) { 
        debugger;
        var org = component.get("v.Org");
        let orgId = '';
        if(org != null && org != 'undefined'){
        	orgId = org.idSforg;
        }
        
        var orgTitle = component.find("OAuthOrgTitle").get("v.value");
        var userName= component.find("OAuthUserName").get("v.value");
        if(orgTitle == undefined || orgTitle == ''){
        	alert('Please enter Org Title.');	    
        }else if(userName == undefined || userName == ''){
            alert('Please enter User Name.');
        }else{
            component.set("v.isgetFetchObjects", true);
            var url = "https://login.salesforce.com/services/oauth2/authorize?response_type=code&client_id=3MVG9zlTNB8o8BA2YHUasMGhWsHJ9u4WDfkdIrAoaZiogfGpjkSg1x36V0gIfgJUGp.6HL4QmyHftw5GDi..g"
            +"&redirect_uri=https://arvaultdev-developer-edition.na59.force.com/apex/testOAuthVfp"
            +"&state="+orgTitle +"|"+userName+"|"+orgId
            +"&login_hint="+userName+"&prompt=login%20consent";
            window.open(url);
            
        }
    },
    oAuthChange: function(component, event, helper) { //add slds-hide on standarddepends
       helper.oAuthChange(component, event, helper) ;
        
	},
    stdChange: function(component, event, helper) { //remove slds-hide on standarddepends
        helper.stdChange(component, event, helper) ;
        
	},
    fetchobjects: function(component, event, helper) {
        /*debugger;
        var existedOrg = component.get("v.existedOrg");
        var orgId = existedOrg.idSforg;
        var isExistedOrg=false;
        helper.afterOrgSaved(component, orgId, isExistedOrg);*/
        var isfetchObjects=  true;
        helper.testExistingConnection(component, event, helper, isfetchObjects);
    },
    saveOrgBtnClick: function(component, event, helper) { 
        /** Manually added for temp */
        var isSave =  true;
        var isfetchObjects=  false;
       helper.testConnection(component, event, helper, isSave, isfetchObjects);
	},
    testSfConnections: function(component, event, helper) { 
       var isSave =  false;
       var isfetchObjects=  false;
       helper.testConnection(component, event, helper, isSave, isfetchObjects);
	},
    Orgchange: function(component, event, helper) { 
        var oldval = event.getParam("oldValue");
        var newval = event.getParam("value");
        //alert('newval:'+JSON.stringify(newval));
        component.set("v.Org", newval);
       // if(newval.sfAuthType == "standard"){
            if(newval.authtype!="new" )
            {
                if(newval.sfAuthType == "standard"){
                     component.set("v.isOAuth", false);
                    component.set("v.isExistedOrg", true);
                var isSave =  true;
                var isfetchObjects=  true;
                    helper.testExistingConnection(component, event, helper, isSave, isfetchObjects);
                    component.find("standardCon").set("v.checked",true);
                    helper.stdChange(component, event, helper) ;
                }
                else
                {
                     helper.testExistingConnection(component, event, helper, isSave, isfetchObjects);
                    component.find("oauthCon").set("v.checked",true);
                     component.set("v.isOAuth", true);
                    helper.oAuthChange(component, event, helper) ;
                }
                /*var cmpEvent = component.getEvent("sforgauthsucess");
                   var org = component.get("v.Org");
                            let orgId = org.idSforg;
                 cmpEvent.setParams({
                  "sfOrgID" : orgId,
                   "isExistedBackupCfg": isfetchObjects
                  });
                    cmpEvent.fire();   */
                
      helper.authAccordinClose(component, event, helper);
            }
        else{
            
                helper.authAccordinOpen(component, event, helper);
             component.set("v.isExistedOrg", false);
        	}
            
      //  }
    }
})