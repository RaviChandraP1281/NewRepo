({
	showListOfBackups : function(component, event, helper) {
        if(component.get("v.sfOrgId") != null){
			var backupList = component.find("backupListOne");
        	$A.util.removeClass(backupList,"slds-hide");
		}
    },
    displayNextSnapshot : function(component, event, helper) {
     	var backupListOne = component.find("backupListOne");
        $A.util.toggleClass(backupListOne,"slds-hide");
        var backupListTwo = component.find("backupListTwo");
        $A.util.toggleClass(backupListTwo,"slds-hide"); 
        component.set("v.snapshotHeader","Snapshot 2");
    },
    displaySnapshotOptions : function(component, event, helper) {
        var backupListTwo = component.find("backupListTwo");
        $A.util.toggleClass(backupListTwo,"slds-hide"); 
        component.set("v.snapshotHeader","Compare snapshots based on ");
        var snapshotOptions = component.find("snapshotOptions");
        $A.util.toggleClass(snapshotOptions,"slds-hide"); 
        
    },
    showFullSnapshot : function(component, event, helper) {
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.removeClass(bothsnapshots,"slds-hide"); 
        var objectOptions = component.find("objectOptions");
        $A.util.addClass(objectOptions,"slds-hide"); 
        var fieldOptions = component.find("fieldOptions");
        $A.util.addClass(fieldOptions,"slds-hide"); 
        var objFieldOptions = component.find("objFieldOptions");
        $A.util.addClass(objFieldOptions,"slds-hide");
        var specificRecord = component.find("specificRecord");
        $A.util.addClass(specificRecord,"slds-hide"); 
        
        component.find("snapshotOne").set("v.body", []);
            var destination ="markup://c:ARV_CompareSnapshotTable";
            $A.createComponent(
                destination,
                {
                    "sfOrgId":component.get("v.sfOrgId"),
                    "snapshotID":component.get("v.firstSelectedSnapID")
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
                    "sfOrgId":component.get("v.sfOrgId"),
                    "snapshotID":component.get("v.secondSelectedSnapID")
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
    showObjectSnapshot : function(component, event, helper) {
        
        helper.getObjectsList(component, event, helper); 
        component.find("snapshotOne").set("v.body", []); 
        component.find("snapshotTwo").set("v.body", []);
        var objectOptions = component.find("objectOptions");
        $A.util.removeClass(objectOptions,"slds-hide"); 
        var objFieldOptions = component.find("objFieldOptions");
        $A.util.addClass(objFieldOptions,"slds-hide"); 
        var fieldOptions = component.find("fieldOptions");
        $A.util.addClass(fieldOptions,"slds-hide"); 
        var specificRecord = component.find("specificRecord");
        $A.util.addClass(specificRecord,"slds-hide"); 
        
        
    },
    showFieldSnapshot : function(component, event, helper) {
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.addClass(bothsnapshots,"slds-hide"); 
        var specificRecord = component.find("specificRecord");
        $A.util.addClass(specificRecord,"slds-hide"); 
    	var objFieldOptions = component.find("objFieldOptions");
        $A.util.removeClass(objFieldOptions,"slds-hide"); 
        var objectOptions = component.find("objectOptions");
        $A.util.addClass(objectOptions,"slds-hide"); 
        helper.getObjectsList(component, event, helper); 
    },
    fetchFieldData : function(component, event, helper) {
        var objName = component.find("objSelectForFields").get("v.value");
        component.set("v.objSelected",objName);
        alert(objName);
        var fieldOptions = component.find("fieldOptions");
        $A.util.toggleClass(fieldOptions,"slds-hide"); 
        helper.getFieldsList(component, event, helper);
        
    },
    showSpinner: function(component, event, helper) {
        component.set("v.Spinner", true); 
   },
    hideSpinner : function(component,event,helper){   
       component.set("v.Spinner", false);
    },
    showRecordSnapshot : function(component, event, helper){
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
    },
    setFieldSelected : function(component, event, helper){
        var fieldName = component.find("fieldSelect").get("v.value");
        component.set("v.fieldSelected", fieldName); 
        alert(fieldName);
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.toggleClass(bothsnapshots,"slds-hide"); 
        var objFieldOptions = component.find("objFieldOptions");
        $A.util.toggleClass(objFieldOptions,"slds-hide"); 
        var fieldOptions = component.find("fieldOptions");
        $A.util.toggleClass(fieldOptions,"slds-hide"); 
        component.find("snapshotOne").set("v.body", []);
            var destination ="markup://c:ARV_CompareSnapshotTable";
            $A.createComponent(
                destination,
                {
                    "sfOrgId":component.get("v.sfOrgId"),
                    "snapshotID":component.get("v.firstSelectedSnapID"),
                    "objSelected":component.get("v.objSelected")
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
                    "sfOrgId":component.get("v.sfOrgId"),
                    "snapshotID":component.get("v.secondSelectedSnapID"),
                    "objSelected":component.get("v.objSelected"),
                    "fieldSelected":component.get("v.fieldSelected")
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
    displayObjectOptions : function(component, event, helper){
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.removeClass(bothsnapshots,"slds-hide"); 
         var objectOptions = component.find("objectOptions");
        $A.util.toggleClass(objectOptions,"slds-hide"); 
        
        component.find("snapshotOne").set("v.body", []);
            var destination ="markup://c:ARV_CompareSnapshotTable";
            $A.createComponent(
                destination,
                {
                    "sfOrgId":component.get("v.sfOrgId"),
                    "snapshotID":component.get("v.firstSelectedSnapID"),
                    "objSelected":component.get("v.objSelected")
                    
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
                    "sfOrgId":component.get("v.sfOrgId"),
                    "snapshotID":component.get("v.secondSelectedSnapID"),
                    "objSelected":component.get("v.objSelected")
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
    changeView : function(component, event, helper){
		helper.showPopupHelper(component, 'modaldialog', 'slds-fade-in-');
		helper.showPopupHelper(component,'backdrop','slds-backdrop--');    	
    },
    hidePopup:function(component,event,helper){
    	helper.hidePopupHelper(component, 'modaldialog', 'slds-fade-in-');
		helper.hidePopupHelper(component, 'backdrop', 'slds-backdrop--');
	},
    	
})