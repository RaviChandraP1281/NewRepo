({
    pickDay :function(component, event, helper){
        var day = event.target.getAttribute("value");
        component.set("v.dayScd", day);
    },
    doInit : function(component, event, helper){
        var dateFormat = "hh:mm";
		var dateString = $A.localizationService.formatDateTime(new Date(), dateFormat);
        component.set("v.currentTime",dateString);        
    },
    addDatePill : function(component, event, helper) {
        var count = true;
      	var val = event.getSource().get("v.value");
        var pills = component.get("v.pills");
        
        for (var i = 0; pills!=null && (i < pills.length); i++){
            if(pills[i]==val){
                count=false;
                break;
            }
        }
     if(count)
        { 
            pills.push(val);
            component.set("v.pills",pills);
        }
	},
    handleRemove: function(component, event, helper) {
     
        
    },
    selfDelete: function(cmp) {
    },
     handlePress : function(cmp) {
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
    },
    handleClick: function(component, event, helper) {
    }
})