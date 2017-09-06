({
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
    oAuthChange: function(component, event, helper) { //add slds-hide on standarddepends
        var oauthdepends = component.find("oauthdepends");
        $A.util.removeClass(oauthdepends,"slds-hide");
        var standarddepends = component.find("standarddepends");
		$A.util.addClass(standarddepends,"slds-hide");
        
	},
    stdChange: function(component, event, helper) { //remove slds-hide on standarddepends
        var standarddepends = component.find("standarddepends");
        $A.util.removeClass(standarddepends,"slds-hide");
        var oauthdepends = component.find("oauthdepends");
        $A.util.addClass(oauthdepends,"slds-hide");
        
	},
    handleClick: function(component, event, helper) { 
     /*   var orgTitleField = component.find("org-title").get("v.value");
		var userNameField = component.find("username").get("v.value");        
        var passwordField = component.find("password").get("v.value");        
        var secTokenField = component.find("securityToken").get("v.value");        
        var action=component.get("c.basicAuthCallout");
        action.setCallback(this,function(re){
            var state=re.getState();
            if(state==='SUCCESS'){
                component.set("v.accounts",re.getReturnValue());
            }
        });

        $A.enqueueAction(action);*/
        /*
         * Manually added for temp
         * 
         */
        var cmpEvent = component.getEvent("sforgauthsucess");
        cmpEvent.setParams({
              "sfOrgID" : "00D6F000001OOISUA4"
        });
        cmpEvent.fire();   
       helper.doInit(component, event, helper);
	}
})