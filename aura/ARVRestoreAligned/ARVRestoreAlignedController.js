({
	objectChange: function(component, event, helper) { //add slds-hide on standarddepends
        var objFilter = component.find("showObjFilter");
        $A.util.removeClass(objFilter,"slds-hide");
        var dateFilter = component.find("showDateFilter");
		$A.util.addClass(dateFilter,"slds-hide");
        
	},
    dateChange: function(component, event, helper) { //remove slds-hide on standarddepends
        var dateFilter = component.find("showDateFilter");
        $A.util.removeClass(dateFilter,"slds-hide");
        var objFilter = component.find("showObjFilter");
        $A.util.addClass(objFilter,"slds-hide");
        
	}
})