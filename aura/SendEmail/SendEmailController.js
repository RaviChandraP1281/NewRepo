({
   openModel: function(component, event, helper) {
      helper.checkAttachment(component);    
   },
   closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.isOpen", false);
      component.set("v.isAttachment", false);
      component.set("v.email", null);
   },
   sendEmail: function(component, event, helper) {
        var getEmail = component.get("v.email");
        if ($A.util.isEmpty(getEmail) || !getEmail.includes("@")) {
            alert('Please Enter valid Email Address');
        } else {
            helper.sendHelper(component, getEmail);            
        }
    }
})