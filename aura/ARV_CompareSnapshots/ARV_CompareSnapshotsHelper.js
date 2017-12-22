({
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
    showSpinner: function(component, event, helper) {
        component.set("v.Spinner", true); 
    },
    hideSpinner : function(component,event,helper){   
       component.set("v.Spinner", false);
    },    
    filterSelSnapshot : function(component, event, helper){
        debugger;
        var bObjects = component.get("v.backupObjects");
        let fbackupID = component.get("v.firstSelectedSnapID");
        if(fbackupID != ''){
            for(let i=0; i< bObjects.length;i++){
                if(bObjects[i].backupId == fbackupID){
                    component.set("v.selSnapshot", bObjects[i]);
                    component.set("v.firstSnapshot", bObjects[i]);                    
                   // bObjects.splice(i, 1);    
                }
            }            
        }
        component.set("v.firstSelectedSnapID", fbackupID);
        component.set("v.backupObjects", bObjects);
    },
    getFullSnapshot : function(component, event, helper) {
    	debugger;
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
                helper.getSnapshotResponse(component);
                component.set("v.firstSelectedSnapID", component.get("v.firstSelectedSnapID"));
                component.set("v.secondSelectedSnapID", component.get("v.secondSelectedSnapID"));
                helper.hideSpinner(component, event, helper);
            }            
        });        
        $A.enqueueAction(action);        
	},
    getSnapshotResponse: function(component) {
        debugger;
        var snapshotDetail1 = component.get("v.snapshotDetail1");
        var snapshotDetail2 =  component.get("v.snapshotDetail2");
        var firstSnapshotID = component.get("v.firstSelectedSnapID");
        var secondSnapshotID =  component.get("v.secondSelectedSnapID");
        component.find("snapshotOne").set("v.body", []);
        var destination ="markup://c:ARV_CompareSnapshotTable";
        $A.createComponent(
            destination,
            {
                "snapshotDetail": snapshotDetail1,
                "snapshotID" : firstSnapshotID,
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
        var destination ="markup://c:ARV_CompareSnapshotTable";
        $A.createComponent(
            destination,
            {
                "snapshotDetail": snapshotDetail2,
                "snapshotID" : secondSnapshotID,
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
    getFieldsSnapshot : function(component, event, helper, objName) {
        debugger;
        var action = component.get("c.getRecordsForCompare");
        action.setParams({ 
            "fbackupID" : component.get("v.firstSelectedSnapID"),
            "sbackupID" : component.get("v.secondSelectedSnapID"),
            "objName" : objName
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
                //alert('recordList1:'+JSON.stringify(bObjects[0]));
                //alert('snapshotRecord1:'+JSON.stringify(bObjects[3]));
                var cols=[];
                var excCols=[];
                for(let i=0; i < allfields.length; i++){
 					let colName = allfields[i];	
                    if(i < 5){
                    	cols.push(colName);    
                    }else{
                        excCols.push(colName);
                    }
                }
                component.set("v.recordColumns", cols);
                component.set("v.unrecordColumns", excCols);
                //component.set("v.objSelected",objSelected);                
                helper.getSnapshotFieldResponse(component, bObjects[0], bObjects[1], 'ARV_CompareFieldSnapshot', objName, '', cols, allfields);
                helper.hideSpinner(component, event, helper);
            }            
        });        
        $A.enqueueAction(action);                          
	},
    getSnapshotFieldResponse: function(component, snapshotDetail1, snapshotDetail2, cmpNameString, objName, selfield, recordColumns, allfields) {
        component.find("rsnapshotOne").set("v.body", []);
            var destination ="markup://c:"+cmpNameString;
            $A.createComponent(
                destination,
                {
                    "headerDetail": component.get("v.snapshotDetail1"),
                    "objectName": objName, 
                    "snapshotDetail": snapshotDetail1,
                    "snapshotID" : component.get("v.firstSelectedSnapID"), 
                    "fieldSelected": selfield,
                    "recordColumns": recordColumns,
                    "fieldList": allfields, 
                    "sequence": 1
                },
                function(newButton){
                    if (component.isValid()) {
                        var body = component.find("rsnapshotOne").get("v.body");
                        body.push(newButton);
                        component.find("rsnapshotOne").set("v.body", body);
                    }
                }
            );
        component.find("rsnapshotTwo").set("v.body", []);
         var destination ="markup://c:"+cmpNameString;
            $A.createComponent(
                destination,
                {
                    "headerDetail": component.get("v.snapshotDetail2"),
                    "objectName": objName, 
                    "snapshotDetail": snapshotDetail2,
                    "snapshotID" : component.get("v.secondSelectedSnapID"), 
                    "fieldSelected": selfield,
                    "recordColumns": recordColumns, 
					"fieldList": allfields, 
                    "sequence": 2
                },
                function(newButton){
                    if (component.isValid()) {
                        var body = component.find("rsnapshotTwo").get("v.body");
                        body.push(newButton);
                        component.find("rsnapshotTwo").set("v.body", body);
                    }
                }
            );
    },
    saveChangeView: function(component, event, helper, recordColumns) {
        debugger;
        var snapshotRec1 = component.get("v.snapshotRecord1");
        var snapshotRec2 = component.get("v.snapshotRecord2");        
        var objName = component.get("v.objectName");
        var allfields= component.get("v.fieldList");
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
            helper.getSnapshotFieldResponse(component, rObjects[0], rObjects[1], 'ARV_CompareChangeField', objName, fieldName, recordColumns, allfields);
            helper.hideSpinner(component, event, helper);
        });
        $A.enqueueAction(action);         
    },

})