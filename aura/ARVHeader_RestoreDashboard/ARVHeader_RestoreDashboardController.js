({
	fireShowGraph : function(component, event, helper){
       $A.util.toggleClass(component.find("graphBtn"),"slds-is-selected");
       helper.fireEvents(component,"displaygraph"); 
    },
	setSfOrgId	 : function(component, event, helper){
      component.set("v.sfOrgId",event.getSource().get("v.value"));
    },
	fireShowRestore : function(component, event, helper){
      helper.fireEvents(component,"displayrestore");
    },
    doInit : function(component, event, helper) {
        helper.getOrgsList(component, event, helper);
    },
    exportToExcel : function(component, event, helper){
   		helper.exportToExcel(component, event, helper) 
    },
    openModel: function(component, event, helper) {
        helper.checkAttachment(component);    
   },
   closeModel: function(component, event, helper) { 
      component.set("v.isOpen", false);
      component.set("v.isAttachment", false);
      component.set("v.email", null);
   },
    sendEmail : function(component, event, helper) {
    	var getEmail = component.get("v.email");
        if ($A.util.isEmpty(getEmail) || !getEmail.includes("@")) {
            alert('Please Enter valid Email Address');
        } else {
            helper.sendEmailHelper(component, getEmail);            
        }
    }
})