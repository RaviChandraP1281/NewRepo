({
	handleInit : function(component, event, helper) {
	   helper.showSpinner(component);
       helper.loadRecordsTable(component, event, helper);       
	},
    handleObjectChange : function(component, event, helper) {
    	var objectName = component.find("objects").get("v.value");
        var obj = component.get("v.objectOptions");
        for(var i=0; i< obj.length; i++){
            var o = obj[i];
            if(o.objname == objectName){
                component.set("v.sObjectInFilter", o.objname);
                component.set("v.sRecCountInFilter", o.records);                
            }
        }
    },
    goRecordFilter : function(component, event, helper) {
        var records = component.get("v.sRecCountInFilter");
        if(records == 0){
            component.set("v.displayMessage", 'There are no records for selected object.');
            component.set("v.isShowMessage", true);
            component.set("v.isShowRecords", false);
        }else{
        	helper.showSpinner(component);
            helper.goRecordFilter(component, event, helper);       
        }
       
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
        var sField = component.find("fields").get("v.value");
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
    checkAllCheckboxes:function(component,event,helper){
        var checkboxes = component.find("backedupRecords");
        for (var i = 0; i < checkboxes.length; i++){
            var chkValue = checkboxes[i].get("v.checked");
            if(chkValue){
            	checkboxes[i].set("v.checked", false);
            }else{
                checkboxes[i].set("v.checked", true);
            }          
        }    
    },
    checkChkBox:function(component,event,helper){
        debugger;
        var selChkBox = event.getSource().get("v.name");
        var checkboxes = component.find("backedupRecords");
        for (var i = 0; i < checkboxes.length; i++){
        	var chkBoxID = checkboxes[i].get("v.name");
            if(chkBoxID == selChkBox){
                var chkValue = checkboxes[i].get("v.checked");
                if(chkValue){
                    checkboxes[i].set("v.checked", true);
                }else{
            		checkboxes[i].set("v.checked", false);        
                }
            }            
        }       
    },
	confirmRestore : function(component, event, helper) {
        alert('Records.confirmRestore');
        var userConfirmedActivities = helper.getCheckedItems(component, "backedupRecords");;
        var objectSel = component.get("v.sObjectInFilter"); 
        var a={
                 "activities":{
                   		"backupId":component.get("v.backupID"),
                        "object":objectSel,
                        "records":userConfirmedActivities
                 }               	 
               };
        component.set("v.userConfirmedActivities",a);
        helper.toastMsg("Restore", "Selection Intiated");
        helper.initiateRestoreAction(component, userConfirmedActivities);        
    },
    leftMove: function(component, event, helper){
       arv.leftMove(component, event, helper);
    },
    rightMove: function(component, event, helper) {
       arv.rightMove(component, event, helper);
    },
    sortTable: function(component, event, helper) {
       let Column = "Column"+event.target.getAttribute("id");
       arv.sortTable(component, event, helper,Column);
    },
	searchInTable: function(component, event, helper) {
      arv.searchInTable(component, event, helper);
    }    
})