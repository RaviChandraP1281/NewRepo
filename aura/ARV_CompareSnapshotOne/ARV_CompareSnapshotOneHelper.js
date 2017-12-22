({
	getFullSnapshot : function(component, event, helper) {
    	var action = component.get("c.getCompareBackups");
    	action.setParams({ 
            "sfOrgID" : component.get("v.sfOrgId"),
            "fbackupID" : component.get("v.firstSelectedSnapID"),
            "sbackupID" : component.get("v.secondSelectedSnapID")
        });
        
        action.setCallback(this, function(response) {
            var bObjects = response.getReturnValue();
            if(bObjects != null && bObjects != 'undefined'){
                component.set("v.snapshotDetail1",bObjects[0]);
                component.set("v.snapshotDetail2",bObjects[1]);
                //alert('Object List:'+JSON.stringify(bObjects[2]));
                component.set("v.objList",bObjects[2]); 
                helper.getSnapshotResponse(component, bObjects[0], bObjects[1], 'ARV_CompareSnapshotTable');
                helper.hideSpinner(component, event, helper);
            }            
        });        
        $A.enqueueAction(action);        
	},
    displayFullSnapshot : function(component, event, helper) {
        
        component.find("snapshot0").set("v.checked", true);
        component.find("snapshot1").set("v.checked", false);
        component.find("snapshot2").set("v.checked", false);
        
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.removeClass(bothsnapshots,"slds-hide"); 
        var snapshotOne = component.find("snapshotOne");
        $A.util.removeClass(snapshotOne,"slds-hide"); 
        var snapshotTwo = component.find("snapshotTwo");
        $A.util.removeClass(snapshotTwo,"slds-hide");                 
        var objectOptions = component.find("objectOptions");
        $A.util.addClass(objectOptions,"slds-hide"); 
        var specificRecord = component.find("specificRecord");
        $A.util.addClass(specificRecord,"slds-hide"); 
    },
    displayObjectSnapshot : function(component, event, helper) {
        
        component.find("snapshot0").set("v.checked", false);
        component.find("snapshot1").set("v.checked", true);
        component.find("snapshot2").set("v.checked", false);
        
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.removeClass(bothsnapshots,"slds-hide"); 
        var objectOptions = component.find("objectOptions");
        $A.util.removeClass(objectOptions,"slds-hide"); 
        var specificRecord = component.find("specificRecord");
        $A.util.addClass(specificRecord,"slds-hide");                 	    
    },
    displayFieldSnapshot : function(component, event, helper) {
        
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.removeClass(bothsnapshots,"slds-hide"); 
        var specificRecord = component.find("specificRecord");
        $A.util.addClass(specificRecord,"slds-hide"); 
    	var objectOptions = component.find("objectOptions");
        $A.util.addClass(objectOptions,"slds-hide");                  
    },
    displaySpRecSnapshot: function(component, event, helper) {
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.removeClass(bothsnapshots,"slds-hide"); 
        var objectOptions = component.find("objectOptions");
        $A.util.addClass(objectOptions,"slds-hide"); 
        var specificRecord = component.find("specificRecord");
        $A.util.removeClass(specificRecord,"slds-hide");        
    },
    getSnapshotFieldResponse: function(component, snapshotDetail1, snapshotDetail2, cmpNameString, selfield, recordColumns) {
        component.find("snapshotOne").set("v.body", []);
            var destination ="markup://c:"+cmpNameString;
            $A.createComponent(
                destination,
                {
                    "snapshotDetail": snapshotDetail1,
                    "snapshotID" : component.get("v.firstSelectedSnapID"), 
                    "fieldSelected": selfield,
                    "recordColumns": recordColumns,
                    //"allFields": allfields, 
                    "sequence": 1
                },
                function(newButton){
                    if (component.isValid()) {
                        var body = component.find("snapshotOne").get("v.body");
                        body.push(newButton);
                        component.find("snapshotOne").set("v.body", body);
                    }
                }
            );
        component.find("snapshotTwo").set("v.body", []);
         var destination ="markup://c:"+cmpNameString;
            $A.createComponent(
                destination,
                {
                    "snapshotDetail": snapshotDetail2,
                    "snapshotID" : component.get("v.secondSelectedSnapID"), 
                    "fieldSelected": selfield,
                    "recordColumns": recordColumns, 
					//"allFields": allfields, 
                    "sequence": 2
                },
                function(newButton){
                    if (component.isValid()) {
                        var body = component.find("snapshotTwo").get("v.body");
                        body.push(newButton);
                        component.find("snapshotTwo").set("v.body", body);
                    }
                }
            );
    },
    getSnapshotResponse: function(component, snapshotDetail1, snapshotDetail2, cmpNameString) {
        component.find("snapshotOne").set("v.body", []);
            var destination ="markup://c:"+cmpNameString;
            $A.createComponent(
                destination,
                {
                    "snapshotDetail": snapshotDetail1,
                    "sequence": 1
                },
                function(newButton){
                    if (component.isValid()) {
                        var body = component.find("snapshotOne").get("v.body");
                        body.push(newButton);
                        component.find("snapshotOne").set("v.body", body);
                    }
                }
            );
        component.find("snapshotTwo").set("v.body", []);
         var destination ="markup://c:"+cmpNameString;
            $A.createComponent(
                destination,
                {
                    "snapshotDetail": snapshotDetail2,
                    "sequence": 2
                },
                function(newButton){
                    if (component.isValid()) {
                        var body = component.find("snapshotTwo").get("v.body");
                        body.push(newButton);
                        component.find("snapshotTwo").set("v.body", body);
                    }
                }
            );
    },
   getFieldsSnapshot : function(component, event, helper) {
        var objSelected = component.get("v.objSelected");
        var objList = component.get("v.objList");
        debugger;
       if(objSelected == ''){
           objSelected = objList[0].objname;
       }
       if(objSelected != ''){
       		var action = component.get("c.getRecordsForCompare");
            action.setParams({ 
                "fbackupID" : component.get("v.firstSelectedSnapID"),
                "sbackupID" : component.get("v.secondSelectedSnapID"),
                "objName" : objSelected
            });
            
            action.setCallback(this, function(response) {
                var bObjects = response.getReturnValue();
                if(bObjects != null && bObjects != 'undefined'){
                    
                    component.set("v.recordList1",bObjects[0]);
                    component.set("v.recordList2",bObjects[1]); 
                    var allfields= bObjects[2];
                    component.set("v.fieldList", allfields);
                    component.set("v.snapshotRecord1",bObjects[3]);
                    component.set("v.snapshotRecord2",bObjects[4]);
                    //alert('allfields:'+JSON.stringify(allfields));
                    var cols=[];
                    for(let i=0; i < 5; i++){
                        let colName = allfields[i];
                        cols.push(colName);
                    }
                    component.set("v.recordColumns", cols);
                    component.set("v.objSelected",objSelected);                
                    helper.getSnapshotFieldResponse(component, bObjects[0], bObjects[1], 'ARV_CompareFieldSnapshot', '', cols);
                    helper.hideSpinner(component, event, helper);
                }            
            });        
            $A.enqueueAction(action);            
       }else{
           helper.hideSpinner(component, event, helper);
       }
       
	},
    saveChangeView: function(component, event, helper) {
        var snapshotRec1 = component.get("v.snapshotRecord1");
        var snapshotRec2 = component.get("v.snapshotRecord2");        
        var recordColumns = component.get("v.recordColumns");
        var objName = component.get("v.objSelected");
        var fieldName = component.get("v.fieldSelected");
        var action = component.get("c.getCompareChangeView");
        action.setParams({ 
            "snapshotRec1":JSON.stringify(snapshotRec1),
            "snapshotRec2":JSON.stringify(snapshotRec2), 
            "objName": objName,
            "recordColumns": recordColumns
        });
        action.setCallback(this, function(response) {
            var rObjects = response.getReturnValue();
            component.set("v.recordColumns", recordColumns);
            component.set("v.recordList1",rObjects[0]);
            component.set("v.recordList2",rObjects[1]); 
            component.set("v.isOpen", false);
            helper.getSnapshotFieldResponse(component, rObjects[0], rObjects[1], 'ARV_CompareFieldSnapshot', fieldName, recordColumns);
            helper.hideSpinner(component, event, helper);
        });
        $A.enqueueAction(action);         
    },
    showPopupHelper: function(component, componentId, className){
        var modal = component.find(componentId);
        $A.util.removeClass(modal, className + 'hide');
        $A.util.addClass(modal, className + 'open');
    },
    hidePopupHelper: function(component, componentId, className){
        var modal = component.find(componentId);
        $A.util.addClass(modal, className+'hide');
        $A.util.removeClass(modal, className+'open');
        component.set("v.body", "");
    },
    showSpinner: function(component, event, helper) {
        component.set("v.Spinner", true); 
    },
    hideSpinner : function(component,event,helper){   
       component.set("v.Spinner", false);
    },
    getBackupsList : function(component, event, helper) {
        debugger;
        let fromDate = component.get("v.fromDate");
        let toDate = component.get("v.toDate");
        var action = component.get("c.getListOfCompareBackups");
        action.setParams({ 
            "sfOrgID" : component.get("v.sfOrgId"),
            "fromDate" : fromDate,
            "toDate" : toDate
         });
        action.setCallback(this, function(response) {
            component.set("v.backupObjects", response.getReturnValue());            
            helper.hideSpinner(component, event, helper);
        });
        $A.enqueueAction(action);        
	},
    filterSelSnapshot : function(component, event, helper){
        var bObjects = component.get("v.backupObjects");
        let fbackupID = component.get("v.firstSelectedSnapID");
        if(fbackupID != ''){
            for(let i=0; i< bObjects.length;i++){
                if(bObjects[i].backupId == fbackupID){
                    component.set("v.selSnapshot", bObjects[i]);
                    bObjects.splice(i, 1);    
                }
            }            
        }
        component.set("v.firstSelectedSnapID", fbackupID);
        component.set("v.backupObjects", bObjects);
    },
    getSpecificRecord : function(component, event, helper){
        debugger;
        let objSelected = component.get("v.objSelected");
        alert('getSpecificRecord.objselected:'+objSelected);
        var snapshotRec1 = component.get("v.snapshotRecord1");
        var snapshotRec2 = component.get("v.snapshotRecord2");
        var fieldName = component.find("spfieldSelect").get("v.value");
        var action = component.get("c.getSpecificRecordValues");
    	action.setParams({ 
            "snapshotRec1":JSON.stringify(snapshotRec1),
            "snapshotRec2":JSON.stringify(snapshotRec2), 
            "fieldName" : fieldName
        });
        
        action.setCallback(this, function(response) {
            var bObjects = response.getReturnValue();
            if(bObjects != null && bObjects != 'undefined'){ 
                component.set("v.valueObjects", bObjects);
                component.set("v.objSelected", objSelected);                
		    }            
        });        
        $A.enqueueAction(action);
    },
    fetchSpecificQuery : function(component, event, helper){
        debugger;
    	var snapshotRec1 = component.get("v.snapshotRecord1");
        var snapshotRec2 = component.get("v.snapshotRecord2");
        var objName = component.get("v.objSelected");
        alert('fetchSpecificQuery.objSelected'+objName);
        var recordColumns = component.get("v.recordColumns");
        var fieldName = component.find("spfieldSelect").get("v.value");
        var fieldComp = component.find("fieldComp").get("v.value");
        var fieldValue = component.find("spValueSelect").get("v.value");
        
        var action = component.get("c.fetchSpecificRecordQuery");
    	action.setParams({ 
            "snapshotRec1":JSON.stringify(snapshotRec1),
            "snapshotRec2":JSON.stringify(snapshotRec2), 
            "objName": objName, 
            "fieldName" : fieldName,
            "fieldComp" : fieldComp,
            "fieldValue" : fieldValue
        });
        
        action.setCallback(this, function(response) {
            var bObjects = response.getReturnValue();
			if(bObjects != null && bObjects != 'undefined'){                
                component.set("v.recordList1",bObjects[0]);
                component.set("v.recordList2",bObjects[1]);
                component.set("v.objSelected",objName);
			    helper.getSnapshotFieldResponse(component, bObjects[0], bObjects[1], 'ARV_CompareFieldSnapshot', fieldName, recordColumns);        
            }            
        });        
        $A.enqueueAction(action);
	}
})