({
	fireShowRecords : function(component, event, helper) {
       var backupID = event.target.getAttribute('name');
       component.set("v.backupID",backupID);
       component.set("v.isShowBackupActive",false);
       helper.getRecordsPerFilter(component);
       helper.toggleHideClass(component,"showbackups");
       helper.toggleHideClass(component,"showrecords");
    },
    backToRestoreActivity : function(component, event, helper) {
       component.set("v.isShowBackupActive",true);
       helper.toggleHideClass(component,"showbackups");
       helper.toggleHideClass(component,"showrecords");
      },
    checkAllCheckboxes : function(component, event, helper) {
         var target = event.getSource();
         var checkboxes = component.find(target.get("v.name"));
         helper.checkAll(checkboxes, target);
    },
    confirmRestore : function(component, event, helper) {
        var userConfirmedActivities =[];
        var a;
        if(component.get("v.isShowBackupActive") == true){
            userConfirmedActivities = helper.getCheckedItems(component, "backupOtherBoxes");
            a={"activities":userConfirmedActivities};
        }
        else
        {
            userConfirmedActivities = helper.getCheckedItems(component, "backedupRecords");
             a={
                 "activities":{
                   		"id":component.get("v.backupID"),
                        "object":component.get("v.selectedObjectInFilter"),
                        "records":userConfirmedActivities
                 }               	 
               };
        }
        debugger;
        console.log(a);
       component.set("v.userConfirmedActivities",a);
       alert("Enter to Confirm Restore");
    }
})