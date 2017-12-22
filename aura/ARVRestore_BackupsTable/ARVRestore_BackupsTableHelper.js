({
    loadObjectsForRecord : function(component, event, helper){
        var rowId = event.target.getAttribute('title');
        var backupactivity = component.get("v.resultCriteria");
        var resultCriteria = backupactivity[rowId].resultCriteria;
        console.log(resultCriteria);
        component.set("v.objectOptions", resultCriteria);
        var objName = resultCriteria[0].objname;
        var rec = resultCriteria[0].records;
        component.set("v.sObjectInFilter",objName); 
        component.set("v.sRecCountInFilter",rec);
        if(rec == 0){
            component.set("v.displayMessage", 'There are no records for selected object.');
            component.set("v.isShowMessage", true);
            component.set("v.isShowRecords", false);
        }else{
            //helper.toggleShowClass(component,"showRecordsTable");
            component.set("v.isShowRecords", true);
            component.set("v.isShowMessage", false);
        }
        
        var cmpEvent = $A.get("e.c:ARV_FilterPicklist_Event");
        cmpEvent.setParams({
            "objectOptions":resultCriteria,
            "sObjectInFilter": objName,
            "sRecCountInFilter": rec,
            "backupID": event.target.getAttribute('name')
        });
       cmpEvent.fire(); 
    },
     getRecordsPerFilter : function(component, event, helper){
         //alert('getRecordsPerFilter'+component.get("v.backupID"));
         var backupID = event.target.getAttribute('name');
         var action = component.get("c.getFObjectsPerBackup");
         action.setParams({ 
            "backupID": backupID, 
            "objName": component.get("v.sObjectInFilter")
         });
		 action.setCallback(this, function(response) {
            var fieldObj = response.getReturnValue();
            var items = [];
             if(fieldObj != null){
             	for (var i = 0; i < 5; i++) {
                    items.push(fieldObj[i]);                  
            	}    
             }
            component.set("v.recordColumns", items);
            helper.hideSpinner(component);
         });
        $A.enqueueAction(action);         
    },
    getSelectedRecords: function(component){
        var backedupRecords = component.find("backedupRecords");
        var selected =[];
        for(var j=0,i=0;j<backedupRecords.length;j++){
            if(backedupRecords[j].get("v.checked")==true)
            {
                selected[i]=backedupRecords[j].get("v.name");
                i++;
            }
        }
        return selected;
	},
    checkAll:function(checkboxes, target){
       if(target.get("v.checked") == true){
            for (var i = 0; i < checkboxes.length; i++){
                checkboxes[i].set("v.checked",true);
            }
         }else{
             for (var i = 0; i < checkboxes.length; i++){
         	   checkboxes[i].set("v.checked",false);
       		 }
         }  
    },
    toggleHideClass:function(component, id){
        var node = component.find(id);
        $A.util.toggleClass(node,'slds-hide');
	},
    toggleShowClass:function(component, id){
        var node = component.find(id);
        $A.util.removeClass(node, 'slds-hide'); 
	},
    getCheckedItems:function(component, id){
        var userConfirmedActivities=[];
             var backedupRecords = component.find(id);
             for(var j=0;j<backedupRecords.length;j++){
                if(backedupRecords[j].get("v.checked") == true){
                    userConfirmedActivities.push(backedupRecords[j].get("v.name"));
                }
            }
        return userConfirmedActivities;
    },
    toastMsg:function(title, message){
         var toastEvent = $A.get("e.force:showToast");
               toastEvent.setParams({
                 "title": "Status",
                 "message": message
               });
               toastEvent.fire();
	},
    showSpinner: function(component) {
        component.set("v.Spinner", true); 
   },
    hideSpinner : function(component){   
       component.set("v.Spinner", false);
    },
    initiateRestoreAction: function(component, userConfirmedActivities, isBackup){
        debugger;
        var action = component.get("c.startRestore");        
        let sfOrgId = component.get("v.sfOrgId");
        if(isBackup){
            var backupID = userConfirmedActivities.backupId;
        	action.setParams({ 
                "backupId": backupID, 
                "srcSfOrgId": sfOrgId, //"00D6F000001OOISUA4",
                "destSfOrgId": sfOrgId, //"00D6F000001OOISUA4",
                "objectName": "",
                "recordIDs" : null, //userConfirmedActivities,
                "userId": "f939bec89dc549d9bb2a5ef164ac0eb5"
            });    
        }else{
            action.setParams({ 
                "backupId": component.get("v.backupID"), 
                "srcSfOrgId": sfOrgId, //"00D6F000001OOISUA4",
                "destSfOrgId": sfOrgId, //"00D6F000001OOISUA4",
                "objectName": component.get("v.sObjectInFilter"),
                "recordIDs" : userConfirmedActivities,
                "userId": "f939bec89dc549d9bb2a5ef164ac0eb5"
            });
        }
        
        action.setCallback(this, function(response) {
            var responseVal = response.getReturnValue();
            
        });
        $A.enqueueAction(action);
    }
})