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
    clickAuthenticate: function(component, event, helper) { 
        alert('clickAuthenticate');
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": "https://login.salesforce.com/services/oauth2/authorize?response_type=token&client_id=3MVG9zlTNB8o8BA2YHUasMGhWsHJ9u4WDfkdIrAoaZiogfGpjkSg1x36V0gIfgJUGp.6HL4QmyHftw5GDi..g&redirect_uri=https://arvault-dev-ed.lightning.force.com/one/one.app#/n/Setup&display=popup"
        });
        urlEvent.fire();
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