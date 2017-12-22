({
    handlecSnapshotEvent: function (component, event, helper) {
        debugger;
        if(event.getParam("cSnapshot")=="1"){
              component.set("v.firstSnapshot", '');
        } 
        else if(event.getParam("cSnapshot")=="2"){
              component.set("v.secondSnapshot", '');
        } 
    },
    loadBackups : function (component, event, helper) {
    	if(component.get("v.sfOrgId") != null){
            helper.showSpinner(component, event, helper);            
            component.set("v.selSnapshot", '');
            component.set("v.firstSelectedSnapID", '');
            helper.getBackupsList(component, event, helper);	
            document.body.setAttribute('style', 'overflow: hidden;');
		}
    },
   displayNextSnapshot : function(component, event, helper) {
        debugger;
        helper.filterSelSnapshot(component, event, helper);           
        component.set("v.snapshotHeader","Snapshot 2");                
    },
    bothSnapshot : function(component, event, helper) {
        //alert('both:'+component.get("v.secondSelectedSnapID"));        
    },
    displaySnapshotOptions : function(component, event, helper) {
        
        helper.showSpinner(component, event, helper);
        var firstSnapshotID = component.get("v.firstSelectedSnapID");
        var secondSnapshotID =  component.get("v.secondSelectedSnapID");
        var bothsnapshots = component.find("bothsnapshots");
        $A.util.removeClass(bothsnapshots,"slds-hide"); 
        var snapshot = component.find("snapshot");
        $A.util.addClass(snapshot,"slds-hide");
        var object = component.find("object");
        $A.util.removeClass(object,"slds-hide");
        var record = component.find("record");
        $A.util.addClass(record,"slds-hide");               

		var liobject = component.find("liobject");
        $A.util.removeClass(liobject,"slds-is-incomplete"); 
        $A.util.addClass(liobject,"slds-is-active");
        $A.util.addClass(liobject,"slds-is-current");
        
        var lisnapshot = component.find("lisnapshot");
        $A.util.removeClass(lisnapshot,"slds-is-active");
        $A.util.removeClass(lisnapshot,"slds-is-current");
        $A.util.addClass(lisnapshot,"slds-is-complete"); 
                
        helper.getFullSnapshot(component, event, helper);        
    },    
    viewSnapshot: function (component, event, helper) {
        debugger;
        if(component.get("v.sfOrgId") != null){
            helper.showSpinner(component, event, helper);
            var snapshot = component.find("snapshot");
            $A.util.removeClass(snapshot,"slds-hide");
            var object = component.find("object");
            $A.util.addClass(object,"slds-hide");
            var record = component.find("record");
            $A.util.addClass(record,"slds-hide");

            var fSnapshot =  component.get("v.firstSelectedSnapID");
            var sSnapshot =  component.get("v.secondSelectedSnapID");
            if(fSnapshot == 'undefined'){
                component.set("v.selSnapshot", '');
                component.set("v.firstSelectedSnapID", '');
                helper.getBackupsList(component, event, helper);			
            }else{
                helper.hideSpinner(component, event, helper);
            }
            
		}        
    },
    viewObject: function (component, event, helper) {
        var snapshot = component.find("snapshot");
        $A.util.addClass(snapshot,"slds-hide");
        var object = component.find("object");
        $A.util.removeClass(object,"slds-hide");
        var record = component.find("record");
        $A.util.addClass(record,"slds-hide");        
    }, 
    viewRecord: function (component, event, helper) {
        var snapshot = component.find("snapshot");
        $A.util.addClass(snapshot,"slds-hide");
        var object = component.find("object");
        $A.util.addClass(object,"slds-hide");
        var record = component.find("record");
        $A.util.removeClass(record,"slds-hide");
        
    },
    showObjectSnapshot : function(component, event, helper) {
        debugger;
        helper.showSpinner(component, event, helper);
        var bothsnapshots = component.find("rbothsnapshots");
        $A.util.removeClass(bothsnapshots,"slds-hide");
        var snapshot = component.find("snapshot");
        $A.util.addClass(snapshot,"slds-hide");
        var object = component.find("object");
        $A.util.addClass(object,"slds-hide");
        var record = component.find("record");
        $A.util.removeClass(record,"slds-hide");

		var liobject = component.find("liobject");
        $A.util.removeClass(liobject,"slds-is-active");
        $A.util.removeClass(liobject,"slds-is-current");
        $A.util.addClass(liobject,"slds-is-complete"); 
        
        var lirecord = component.find("lirecord");
        $A.util.removeClass(lirecord,"slds-is-incomplete"); 
        $A.util.addClass(lirecord,"slds-is-active");
        $A.util.addClass(lirecord,"slds-is-current");
                
        var objectName = event.getParam("objectName");
        component.set("v.objectName", objectName);
        helper.getFieldsSnapshot(component, event, helper, objectName);
    },
    changeView : function(component, event, helper) {        
        component.set("v.isOpen", true);  	
    },
    closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "False"  
      component.set("v.isOpen", false);      
   },
    saveModel: function(component, event, helper) {
        helper.showSpinner(component);
        var selColumns = component.get("v.recordColumns");
        //var allColumns = component.get("v.fieldList");
        var checkboxes = component.find("chkBox");
        var checkboxesChecked = [];
        let len = selColumns.length;
        if(len > 5){	
            alert('Please delete a column before you add another column.\n We can only select 5 columns.');
        }else{
            for (var i=0; i<checkboxes.length; i++) { 
                let chkObject = checkboxes[i];
                if(chkObject.get("v.checked")){
	            	checkboxesChecked.push(chkObject.get("v.value"));                            
                }
            }
            component.set("v.recordColumns", checkboxesChecked);
            helper.saveChangeView(component, event, helper, checkboxesChecked); 			            
        }                         
    },  
    checkUncheckBox:function(component,event,helper){
        debugger;
        var colName = event.getSource().get("v.name");
        var selColumns = component.get("v.recordColumns");
        var unselColumns = component.get("v.unrecordColumns");
        var colChkBox = component.find("chkBox");        
        for(var i=0; i < colChkBox.length; i++){
            let chkObject = colChkBox[i];
            if(chkObject.get("v.name") == colName){
                if(chkObject.get("v.checked")){
                    selColumns.push(colName);
                    let indx = unselColumns.indexOf(colName);
                    if(indx > -1){
                        unselColumns.splice( indx, 1);  
                    }
                }else{
                    unselColumns.push(colName);
                    let indx = selColumns.indexOf(colName);
                    if(indx > -1){
                        selColumns.splice( indx, 1);  
                    }
                }   
            }            
        }
        
        component.set("v.unrecordColumns",unselColumns);
        component.set("v.recordColumns",selColumns);
    }
})