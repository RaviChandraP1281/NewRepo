({
    doInit : function(component, event, helper){
        var dateFormat = "hh:mm";
		var dateString = $A.localizationService.formatDateTime(new Date(), dateFormat);
        alert(dateString);
        component.set("v.currentTime",dateString);
        debugger;
        
    },
    addDatePill : function(component, event, helper) {
        $A.createComponent("",{
            
        },function(newButton, status, errorMessage){
                if (status === "SUCCESS") {
                    var body = component.find("datepick").get("v.body");
                    body.push(newButton);
                    component.find("datepick").set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.");
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                }
            }
        );
	},
    selfDelete: function(cmp) {
        console.log("button pressed");
    },
     handlePress : function(cmp) {
        console.log("button pressed");
    },
	displayFreqOptions : function(component, event, helper) {
		if(component.find("freq").get("v.value") == "weekly"){ 
            var selectweek = component.find("selectWeek");
       	    $A.util.removeClass(selectweek,"slds-hide");
            var selecttime = component.find("selecttime");
        	$A.util.removeClass(selecttime,"slds-hide");
            var selectdate = component.find("selectdate");
        	$A.util.addClass(selectdate,"slds-hide");
            $A.util.addClass(component.find("datepick"),"slds-hide");
	}
        if(component.find("freq").get("v.value") == "daily"){ 
            var selectweek = component.find("selectWeek");
       	    $A.util.addClass(selectweek,"slds-hide");
            var selecttime = component.find("selecttime");
        	$A.util.removeClass(selecttime,"slds-hide");
            var selectdate = component.find("selectdate");
        	$A.util.addClass(selectdate,"slds-hide");
            $A.util.addClass(component.find("datepick"),"slds-hide");
	}
        if(component.find("freq").get("v.value") == "monthly"){ 
            var selectweek = component.find("selectWeek");
       	    $A.util.addClass(selectweek,"slds-hide");
            var selecttime = component.find("selecttime");
        	$A.util.removeClass(selecttime,"slds-hide");
            var selectdate = component.find("selectdate");
        	$A.util.removeClass(selectdate,"slds-hide");
            $A.util.removeClass(component.find("datepick"),"slds-hide");
	}
    }
})