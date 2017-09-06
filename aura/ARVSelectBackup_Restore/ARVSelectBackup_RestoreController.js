({
	showTheRecords : function(component, event, helper) {
      helper.toggleHideClass(component,"showrecords");
      helper.toggleHideClass(component,"showfields");
	},
    backToObjects : function(component, event, helper) {
      helper.toggleHideClass(component,"showbackups");
      helper.toggleHideClass(component,"showrecords");
    },
    showTheBackups : function(component, event, helper) {
      helper.getBackupActivities(component, helper);
	},
    backToRestore : function(component, event, helper) {
      helper.toggleHideClass(component,"restoreHeader");
      helper.toggleHideClass(component,"restoreBody");
      helper.toggleHideClass(component,"restorePage");
    },
    confirmRestore: function(component, event, helper) {
    }
})