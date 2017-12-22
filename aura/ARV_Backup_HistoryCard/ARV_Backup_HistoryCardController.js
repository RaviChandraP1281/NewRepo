({
    leftMove: function(component, event, helper){
       arv.leftMove(component, event, helper);
       helper.updatechart(component, event, helper);
    },
    rightMove: function(component, event, helper) {
        debugger;
       arv.rightMove(component, event, helper);
        helper.updatechart(component, event, helper);
    },
    sortTable: function(component, event, helper) {
          debugger;
       arv.sortTable(component, event, helper);
        helper.updatechart(component, event, helper);
    },
	searchInTable: function(component, event, helper) {
      arv.searchInTable(component, event, helper);
      helper.updatechart(component, event, helper);
    },
    navigateToActivityObject : function(component, event, helper) {
        var sfOrgId = component.get("v.sfOrgId");
        var backupActivityID = event.target.id;
        var cmpEvent = component.getEvent("activityObjects");   
        cmpEvent.setParams({
            "sfOrgId":sfOrgId,
            "backupActivityID":backupActivityID
        });
      	cmpEvent.fire();
	},
    viewLog : function(component, event, helper) {
        helper.previewLog(component, event, helper);
    },
    closeModel: function(component, event, helper) {
      component.set("v.isOpen", false);      
   },
   showBackupDetail: function(component, event, helper) {
   		var div = component.find("showBDetail");
        $A.util.toggleClass(div, "");
        //$A.util.removeClass(div, "slds-hide");
        //$A.util.addClass(div, "");
   }
})