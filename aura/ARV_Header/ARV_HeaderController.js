({
    doInit : function(component, event, helper) {
		helper.doInit(component, event, helper);
    },
	showMenu : function(component, event, helper) {
        
		var show = component.find("dropdown");
        $A.util.removeClass(show,'slds-hide');
           
	},
     hidePopover : function(cmp, evt) {
        var myPopover = cmp.find('dropdown');
        $A.util.toggleClass(myPopover, 'slds-hide');
    }
})