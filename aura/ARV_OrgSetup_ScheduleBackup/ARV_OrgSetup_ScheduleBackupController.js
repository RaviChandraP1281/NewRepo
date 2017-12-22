({
    pickDay :function(component, event, helper){
        var day = event.target.getAttribute("value");
        component.set("v.dayScd", day);
    },
    doInit : function(component, event, helper){
        var dateFormat = "HH:mm";
		var dateString = $A.localizationService.formatDateTime(new Date(), dateFormat);
        console.log(dateString);
        component.set("v.currentTime",dateString);    
        
        helper.loadHours(component, event, helper);
        helper.loadMinutes(component, event, helper);
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
	displayFreqOptions : function(component, event, helper) {
        	if(component.find("freq").get("v.value") == "N"){ 
                 var selectweek = component.find("selectWeek");
                $A.util.removeClass(selectweek,"slds-hide");
                var selecttime = component.find("selecttime");
                $A.util.removeClass(selecttime,"slds-hide");
                var selectdate = component.find("selectdate");
                $A.util.removeClass(selectdate,"slds-hide");
                $A.util.removeClass(component.find("datepick"),"slds-hide");
                component.set("v.isFlScdFeq", false);
            }
		if(component.find("freq").get("v.value") == "W"){ 
            var selectweek = component.find("selectWeek");
       	    $A.util.removeClass(selectweek,"slds-hide");
            var selecttime = component.find("selecttime");
        	$A.util.removeClass(selecttime,"slds-hide");
            var selectdate = component.find("selectdate");
        	$A.util.addClass(selectdate,"slds-hide");
            $A.util.addClass(component.find("datepick"),"slds-hide");
            component.set("v.isFlScdFeq", true);
            helper.selectWeek(component, event, helper);
	}
        if(component.find("freq").get("v.value") == "D"){ 
            var selectweek = component.find("selectWeek");
       	    $A.util.addClass(selectweek,"slds-hide");
            var selecttime = component.find("selecttime");
        	$A.util.removeClass(selecttime,"slds-hide");
            var selectdate = component.find("selectdate");
        	$A.util.addClass(selectdate,"slds-hide");
            $A.util.addClass(component.find("datepick"),"slds-hide");
            component.set("v.isFlScdFeq", false);
	}
        if(component.find("freq").get("v.value") == "M"){ 
            var selectweek = component.find("selectWeek");
       	    $A.util.addClass(selectweek,"slds-hide");
            var selecttime = component.find("selecttime");
        	$A.util.removeClass(selecttime,"slds-hide");
            var selectdate = component.find("selectdate");
        	$A.util.removeClass(selectdate,"slds-hide");
            $A.util.removeClass(component.find("datepick"),"slds-hide");
            component.set("v.isFlScdFeq", false);
	}
    },
    onFlScdFeqChange:function(component, event, helper) {
        debugger;
       if(component.get("v.flScdFeq") == "W")
       {
      	 component.set("v.isFlScdFeq", true);
         helper.selectWeek(component, event, helper);
       }else{
           component.set("v.isFlScdFeq", false);
       }
    },
    saveInfo : function(component, event, helper) {
		var time = component.find("time").get("v.value");
        var ampm = component.find("ampm").get("v.value");
        var dates = component.find("dates").get("v.value");
        var minutes = component.find("minutes").get("v.value");
        var getBObjects = component.get("c.getTimeStamp");
        getBObjects.setParams({ 
            "dateStr":dates, 
            "timeStr":time, 
            "minuteStr": minutes, 
            "ampm":ampm
        });            
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();
        	alert(bObjects); 
        });
                               
        $A.enqueueAction(getBObjects); 
	}
})