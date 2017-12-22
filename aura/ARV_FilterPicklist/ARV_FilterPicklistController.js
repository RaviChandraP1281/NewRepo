({
	handleInit : function(component, event, helper) {
        alert('columns:'+component.get("v.recordColumns"));
        var objectName = component.get("v.sObjectInFilter");
        var recCount = component.get("v.sRecCountInFilter");
        if(recCount != 0){
        	var backupID = component.get("v.backupID");
            var getObjects = component.get("c.getRecordsFromBackup");
            getObjects.setParams({ "backupID" : backupID, 
                                   "objName": objectName});
            getObjects.setCallback(this, function(a) {
                var rObjects = a.getReturnValue();  
                component.set("v.recordObjects", rObjects);
                component.set("v.records", rObjects);
                
            });
            $A.enqueueAction(getObjects);    
        }else{
            component.set("v.displayMessage", 'There are no records for selected object.');
        }                     
    },
    handleObjectChange : function(component, event, helper) {
        debugger;
        var objectName = component.find("objects").get("v.value");
        var obj = component.get("v.objectOptions");
        for(var i=0; i< obj.length; i++){
            var o = obj[i];
            if(o.objname == objectName){
                component.set("v.sObjectInFilter", o.objname);
                component.set("v.sRecCountInFilter", o.records);
                
            }
        }
        //alert('name:'+objectName.objname+':rec:'+objectName.records);
        
        // Get a reference to the dependent picklist
        /*  var getRObjects = component.get("c.getFObjectsPerBackup");
        
        getRObjects.setParams({ "backupID" : backupID, 
                               "objName": objectName});
        getRObjects.setCallback(this, function(a) {
            var fieldObjs = a.getReturnValue();  
            component.set("v.fieldOptions", fieldObjs);
            component.set("v.sFieldInFilter", fieldObjs[0]);     
        });                               
        $A.enqueueAction(getRObjects); */
    },
    goRecordFilter : function(component, event, helper) {
        var columns = component.get("v.recordColumns");
        alert('columns:'+columns);
        var records = component.get("v.sRecCountInFilter");
        if(records == 0){
            component.set("v.displayMessage", 'There are no records for selected object.');
            component.set("v.isShowMessage", true);
            component.set("v.isShowRecords", false);
        }else{
            //helper.getRecordsPerFilter(component, event, helper);
	       // helper.goRecordFilter(component, event, helper);
            //var cmpEvent = $A.get("e.c:ARV_RestoreRecordsTable_Event");
       		//cmpEvent.fire(); 
       		//component.getEvent("recordsByObjects").fire();            
        }
    },
    changeView : function(component, event, helper){
		component.set("v.isOpen", true);  	
    },
    closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.isOpen", false);      
   },
    saveModel:function(component,event,helper){
        
        component.set("v.isOpen", false);  
    	//helper.hidePopupHelper(component, 'modaldialog', 'slds-fade-in-');
		//helper.hidePopupHelper(component, 'backdrop', 'slds-backdrop--');
	},
    findFields:function(component,event,helper){
        alert('findFields');
        helper.getRecordsPerFilter(component,event,helper);
    }
})