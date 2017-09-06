({
	showMenu : function(component, event, helper) {
		var show = component.find("SelectOrgDropdown");
        $A.util.removeClass(show,'slds-hide');
           
	},
     hidePopover : function(cmp, evt) {
        var myPopover = cmp.find('SelectOrgDropdown');
        $A.util.toggleClass(myPopover, 'slds-hide');
    },
    fireToNewOrg : function(component, event, helper){
        	var cmpEvent = component.getEvent("neworg");
        	cmpEvent.fire();    
            var Back = event.target;
            if(Back.innerHTML ==  "Back")
                Back.innerHTML =  "Register New Org";
            else
                Back.innerHTML =  "Back";
    }
})