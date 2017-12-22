({
	loadRecordsTable : function(component, event, helper) {
        var objectOptions= event.getParam("objectOptions");        
        var objName = event.getParam("sObjectInFilter");
        var rec = event.getParam("sRecCountInFilter");
        var backupID = event.getParam("backupID");
        if(rec != 0){
             var action = component.get("c.getRecordsFromBackup");
             action.setParams({ 
                "backupID": backupID, 
                "objName": objName
             });
             action.setCallback(this, function(response) {
                var rObjects = response.getReturnValue();
                 var items = [];
                 var allColItems = [];
                 if(rObjects != null){
                     var colNameList = rObjects[0].ColumnName;
                     for (var i = 0; i < colNameList.length; i++) {
                        if(i < 5){
                        	items.push(colNameList[i]);                      
                        }
                        allColItems.push(colNameList[i]);                  
                     }    
                 }
                component.set("v.recordColumns", items);
                component.set("v.allFields", allColItems); 
                //component.set("v.records", rObjects); 
                component.set("v.resultCriteria", rObjects); 
                component.set("v.topResultCriteria", rObjects.slice(0, 10)); 
                component.set("v.objectOptions", objectOptions);
                component.set("v.sObjectInFilter", objName);
                component.set("v.sRecCountInFilter", rec);
                component.set("v.backupID", backupID);
            	component.set("v.isShowMessage", false);
             	component.set("v.isShowRecords", true); 
                helper.hideSpinner(component);
             });
            $A.enqueueAction(action); 
        }else{
            component.set("v.displayMessage", 'There are no records for selected object.');
            component.set("v.isShowMessage", true);
            component.set("v.isShowRecords", false);
            component.set("v.objectOptions", objectOptions);
            component.set("v.sObjectInFilter", objName);
            component.set("v.sRecCountInFilter", rec);
            component.set("v.backupID", backupID);
            helper.hideSpinner(component);
        }                 
	},
    goRecordFilter : function(component, event, helper) {
        debugger;
        
    	var objName = component.get("v.sObjectInFilter");
        var rec = component.get("v.sRecCountInFilter");
        var backupID = component.get("v.backupID");
        if(rec != 0){
             var action = component.get("c.getRecordsFromBackup");
             action.setParams({ 
                "backupID": backupID, 
                "objName": objName
             });
             action.setCallback(this, function(response) {
                var rObjects = response.getReturnValue();
                 var items = [];
                 var allColItems = [];
                 if(rObjects != null && rObjects.length > 0){
                     var colNameList = rObjects[0].ColumnName;                     
                    for (var i = 0; i < colNameList.length; i++) {
                        if(i < 5){
                            items.push(colNameList[i]);                  
                        }
                        allColItems.push(colNameList[i]);                  
                    }    
                 }
                //alert('items:'+items);
                component.set("v.recordColumns", items);
                component.set("v.allFields", allColItems); 
               // component.set("v.records", rObjects); 
               component.set("v.resultCriteria", rObjects); 
               component.set("v.topResultCriteria", rObjects.slice(0, 10)); 
                component.set("v.isShowMessage", false);
             	component.set("v.isShowRecords", true); 
                helper.hideSpinner(component);
             });
            $A.enqueueAction(action); 
        }else{
            component.set("v.displayMessage", 'There are no records for selected object.');
            component.set("v.isShowMessage", true);
            component.set("v.isShowRecords", false);
            helper.hideSpinner(component);
        }   
    },
    saveChangeView: function(component, event, helper) {
        var rec = component.get("v.sRecCountInFilter");
        if(rec != 0){
            var backupID = component.get("v.backupID");
            var recordColumns = component.get("v.recordColumns");
            var objName = component.get("v.sObjectInFilter");
            var action = component.get("c.getChangeViewRecords");
            action.setParams({ 
                "backupID": backupID, 
                "objName": objName,
                "recordColumns": recordColumns
            });
            action.setCallback(this, function(response) {
                var rObjects = response.getReturnValue();
                component.set("v.recordColumns", recordColumns);
               // component.set("v.records", rObjects); 
               component.set("v.resultCriteria", rObjects); 
			   component.set("v.topResultCriteria", rObjects.slice(0, 10)); 
                component.set("v.isShowMessage", false);
                component.set("v.isShowRecords", true); 
                component.set("v.isOpen", false);
                helper.hideSpinner(component);
            });
            $A.enqueueAction(action);
        }else{
            component.set("v.displayMessage", 'There are no records for selected object.');
            component.set("v.isShowMessage", true);
            component.set("v.isShowRecords", false);
            helper.hideSpinner(component);
        } 
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
    initiateRestoreAction: function(component, userConfirmedActivities){
        var action = component.get("c.startRestore");
        let sfOrgId = component.get("v.sfOrgId");
        action.setParams({ 
            "backupId": component.get("v.backupID"), 
            "srcSfOrgId": sfOrgId, //"00D6F000001OOISUA4",
			"destSfOrgId": sfOrgId, //"00D6F000001OOISUA4",
            "objectName": component.get("v.sObjectInFilter"),
            "recordIDs" : userConfirmedActivities,
            "userId": "f939bec89dc549d9bb2a5ef164ac0eb5"
        });
        action.setCallback(this, function(response) {
            var responseVal = response.getReturnValue();
            
        });
        $A.enqueueAction(action);
    }
})