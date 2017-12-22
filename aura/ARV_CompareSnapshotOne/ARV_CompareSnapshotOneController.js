({
	showListOfBackups : function(component, event, helper) {
        if(component.get("v.sfOrgId") != null){
            helper.showSpinner(component, event, helper);
            var backupList = component.find("backupListOne");
        	$A.util.removeClass(backupList,"slds-hide");
            var bothsnapshots = component.find("bothsnapshots");
            $A.util.addClass(bothsnapshots,"slds-hide");
            var snapshotOne = component.find("snapshotOne");
            $A.util.addClass(snapshotOne,"slds-hide"); 
            var snapshotTwo = component.find("snapshotTwo");
            $A.util.addClass(snapshotTwo,"slds-hide");                 
            var snapshotOptions = component.find("snapshotOptions");
            $A.util.addClass(snapshotOptions,"slds-hide");

            component.set("v.selSnapshot", '');
            component.set("v.firstSelectedSnapID", '');
            helper.getBackupsList(component, event, helper);			
		}
    },
    displayNextSnapshot : function(component, event, helper) {
        debugger;
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.addClass(bothsnapshots,"slds-hide");
        /*var snapshotOne = component.find("snapshotOne");
        $A.util.toggleClass(snapshotOne,"slds-hide"); 
        var snapshotTwo = component.find("snapshotTwo");
        $A.util.toggleClass(snapshotTwo,"slds-hide");                 */
        var snapshotOptions = component.find("snapshotOptions");
        $A.util.addClass(snapshotOptions,"slds-hide");

        helper.filterSelSnapshot(component, event, helper);
        
        var backupListOne = component.find("backupListOne");
        $A.util.addClass(backupListOne,"slds-hide");
        var backupListTwo = component.find("backupListTwo");
        $A.util.removeClass(backupListTwo,"slds-hide");
        component.set("v.snapshotHeader","Snapshot 2");                
    },
    displaySnapshotOptions : function(component, event, helper) {
        
        helper.showSpinner(component, event, helper);
        var backupListTwo = component.find("backupListTwo");
        $A.util.addClass(backupListTwo,"slds-hide"); 
        component.set("v.snapshotHeader","Compare snapshots based on ");
        var snapshotOptions = component.find("snapshotOptions");
        $A.util.removeClass(snapshotOptions,"slds-hide");
        helper.getFullSnapshot(component, event, helper);        
        helper.displayFullSnapshot(component, event, helper);        
    },
    showFullSnapshot : function(component, event, helper) {
        debugger;
        helper.showSpinner(component, event, helper);
        helper.getFullSnapshot(component, event, helper);        
        helper.displayFullSnapshot(component, event, helper);                
    },
    showObjectSnapshot : function(component, event, helper) {
        debugger;
        helper.showSpinner(component, event, helper);
        var objectName = event.getParam("objectName");
        //alert('objectName:'+objectName);
        if(objectName != 'undefined'){
            component.set("v.objSelected", objectName);			            
        }
        helper.getFieldsSnapshot(component, event, helper);
        helper.displayObjectSnapshot(component, event, helper);
    },
    showRecordSnapshot : function(component, event, helper){
        //alert('showRecordSnapshot.objSelected:'+component.get("v.objSelected"));
        component.find("snapshot0").set("v.checked", false);
        component.find("snapshot1").set("v.checked", false);
        component.find("snapshot2").set("v.checked", true);        
        
        component.find("snapshotOne").set("v.body", []); 
        component.find("snapshotTwo").set("v.body", []);
        var objectOptions = component.find("objectOptions");
        $A.util.addClass(objectOptions,"slds-hide"); 
        var objFieldOptions = component.find("objFieldOptions");
        $A.util.addClass(objFieldOptions,"slds-hide"); 
        var fieldOptions = component.find("fieldOptions");
        $A.util.addClass(fieldOptions,"slds-hide"); 
        var specificRecord = component.find("specificRecord");
        $A.util.removeClass(specificRecord,"slds-hide"); 
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.addClass(bothsnapshots,"slds-hide"); 
        component.set("v.objSelected", component.get("v.objSelected"));
    },
    setSpecificField : function(component, event, helper){
        var fieldName = component.find("spfieldSelect").get("v.value");
        if(fieldName != ''){
        	helper.getSpecificRecord(component, event, helper);    
        }        
    },
    displayObjectOptions : function(component, event, helper){
    	debugger;
        helper.showSpinner(component, event, helper);
        helper.getFieldsSnapshot(component, event, helper);
        helper.displayObjectSnapshot(component, event, helper);                                 
    },
    hidePopup:function(component,event,helper){
    	helper.hidePopupHelper(component, 'modaldialog', 'slds-fade-in-');
		helper.hidePopupHelper(component, 'backdrop', 'slds-backdrop--');
	},
    changeView : function(component, event, helper){
		component.set("v.isOpen", true);  	
    },
    closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "False"  
      component.set("v.isOpen", false);      
   },
    saveModel: function(component, event, helper) {
       helper.showSpinner(component);
       helper.saveChangeView(component, event, helper);         
   },
    AddNewRow:function(component,event,helper){
        debugger;
        var sField = component.find("allfields").get("v.value");
        var recordColumns = component.get("v.recordColumns");
        var len = recordColumns.length;
        if(len > 4){
            alert('Please delete a column before you add another column.\n We can only select 5 columns.')
        }else{
        	var i = recordColumns.indexOf(sField);
            if(i == -1){
            	recordColumns.push(sField);    
            }else{
                alert('Column already exists, Please select another one.')
            }            
        }
        component.set("v.recordColumns",recordColumns);
    },
    removeRow:function(component,event,helper){
        debugger;
        var selField = event.getSource().get("v.name");
        var recordColumns = component.get("v.recordColumns");
        var index = recordColumns.indexOf(selField);
        if (index > -1) {
            recordColumns.splice(index, 1);
        }
        component.set("v.recordColumns",recordColumns);
    }, 
    submitQuery : function(component, event, helper){
        //alert('submitQuery.objSelected:'+component.get("v.objSelected"));
        helper.fetchSpecificQuery(component, event, helper); 
        helper.displaySpRecSnapshot(component, event, helper);
    }
})