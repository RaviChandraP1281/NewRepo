({
	getOrgsList : function(component, event, helper) {
        var action = component.get("c.getOrgsList");
          var idUser = ''
          action.setParams({ 
            "idUser" : "f939bec89dc549d9bb2a5ef164ac0eb5"
         });
        action.setCallback(this, function(response) {
            component.set("v.orgData",response.getReturnValue());
        });
        $A.enqueueAction(action);
        
	},
    hidehover : function(cmp, evt) {
          var myPopover = cmp.find('SelectOrgDropdown');
        $A.util.toggleClass(myPopover, 'slds-hide');
    },
   
       
})