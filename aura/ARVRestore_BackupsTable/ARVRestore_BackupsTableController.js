({
	fireShowRecords : function(component, event, helper) {
        //helper.showSpinner(component);
       var backupID = event.target.getAttribute('name');
       component.set("v.backupID",backupID);
       component.set("v.isShowBackupActive",false);
       helper.loadObjectsForRecord(component, event, helper);
       helper.toggleHideClass(component,"showbackups");
       helper.toggleHideClass(component,"showrecords"); 
       document.body.setAttribute('style', 'overflow: hidden;');
       //helper.getRecordsPerFilter(component, event, helper);       
    },
    onBackup: function(component, event, helper) {
    	debugger;
        var backupObj = event.getSource().get("v.value");
        component.set("v.selBackupObject" , backupObj);     
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
        debugger;
        var selBackUp = component.get("v.selBackupObject");
        var userConfirmedActivities =[];
        //var backups = [];
        var a;
        if(component.get("v.isShowBackupActive") == true){
            
            if(selBackUp != null){
                helper.initiateRestoreAction(component, selBackUp, true);  
            }else{
                userConfirmedActivities = helper.getCheckedItems(component, "backupOtherBoxes");
                 helper.initiateRestoreAction(component, userConfirmedActivities, false);    
            }            
            
        }
       //component.set("v.userConfirmedActivities",a);
       helper.toastMsg("Restore", "Selection Intiated");
    },
    goBackupActivitiesByFilter: function(component, event, helper) {
         var bObjects = event.getParam("backupactivity");
   		 component.set("v.resultCriteria", bObjects);
         component.set("v.topResultCriteria", bObjects.slice(0, 10));
	},
    leftMove: function(component, event, helper){
       arv.leftMove(component, event, helper);
    },
    rightMove: function(component, event, helper) {
       arv.rightMove(component, event, helper);
    },
    sortTable: function(component, event, helper) {
       let Column = ""+event.target.getAttribute("id");
       arv.sortTable(component, event, helper, Column);
    },
	searchInTable: function(component, event, helper) {
      arv.searchInTable(component, event, helper);
    },
    goBackupFilter : function(component, event, helper) {
        debugger;
		var sfOrgId = component.get("v.sfOrgId");
        var yearValue = component.find("YearObjects").get("v.value");
        var monthValue = component.find("MonthObjects").get("v.value");
        var fDateField = component.find("fromDate").get("v.value");
        var tDateField = component.find("toDate").get("v.value");
        
        var getBObjects = component.get("c.getBackupsForRestore");
        getBObjects.setParams({ 
            "sfOrgID" : sfOrgId,
            "sYear": yearValue, 
            "sMonth":monthValue, 
            "sFromDate":fDateField, 
            "sToDate":tDateField
        });            
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();
            component.set("v.backupObjects", bObjects);
          //  component.set("v.backupactivity", bObjects);
            
           var cmpEvent = component.getEvent("goBackupActivitiesByFilter");;
            cmpEvent.setParams({
                "backupactivity":bObjects
            });
       		cmpEvent.fire(); 
        });
                               
        $A.enqueueAction(getBObjects); 
        
	}

})