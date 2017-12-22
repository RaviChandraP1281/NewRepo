({
    compareSnapshots : function(component, event, helper) {
        var compEvent = component.getEvent("compareSnapshot");
        compEvent.fire();  
	},
	doInit : function(component, event, helper) {
         arv.setUIChanges(component,helper);
	},
    orgChangeEvent: function(component, event, helper) {
      component.set("v.sfOrgId", event.getParam("sfOrgId"));
	},
    editFirstSnapshot: function(component, event, helper) {
          var compEvent = component.getEvent("cSnapshotEvent");
            compEvent.setParams({
                cSnapshot:"1"
            });
        compEvent.fire();  
      /*  component.set("v.countofSnapshots", 1);
        component.set("v.radiobtnDisabled",false);*/
    },
    editSecondSnapshot: function(component, event, helper) {
         var compEvent = component.getEvent("cSnapshotEvent");
            compEvent.setParams({
                cSnapshot:"2"
            });
        compEvent.fire();  
       /* component.set("v.countofSnapshots", 2);
        component.set("v.radiobtnDisabled",false);*/
    }
})