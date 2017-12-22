({
    showModal :  function(component, event, helper){
	    component.set("v.isDownload", true);
	},
    closeModal :  function(component, event, helper){
	    component.set("v.isDownload", false);
	},
    saveit:function(component, event, helper){
        component.set("v.isDownload", false);
    },
    download: function(component, event, helper){
    },
    oldbackups:function(component, event, helper){
       arv.old(component, event, helper);
       helper.updatechart(component, event, helper);
    }, 
    recentbackups:function(component, event, helper){
       arv.recent(component, event, helper);
       helper.updatechart(component, event, helper);
    },
    leftMove: function(component, event, helper){
       arv.leftMove(component, event, helper);
       helper.updatechart(component, event, helper);
    },
    rightMove: function(component, event, helper) {
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
   }
})