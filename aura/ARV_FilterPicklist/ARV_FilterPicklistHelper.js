({
     getRecordsPerFilter : function(component, event, helper){
         var backupID = component.get("v.backupID");
         var objName = component.get("v.sObjectInFilter");
         var action = component.get("c.getFObjectsPerBackup");
         action.setParams({ 
            "backupID": backupID, 
            "objName": objName
         });
		 action.setCallback(this, function(response) {
            var fieldObj = response.getReturnValue();
            var items = [];
             if(fieldObj != null){
             	for (var i = 0; i < 5; i++) {
                    items.push(fieldObj[i]);                  
            	}    
             }
            component.set("v.fieldsObjects", fieldObj);
            component.set("v.recordColumns", items);            
        });
        $A.enqueueAction(action);         
    },
    goRecordFilter : function(component, event, helper) {
        var objectName = component.get("v.sObjectInFilter");
        var backupID = component.get("v.backupID");
        var getRObjects = component.get("c.getRecordsFromBackup");
        getRObjects.setParams({ "backupID" : backupID, 
                               "objName": objectName }); 
                              
        getRObjects.setCallback(this, function(a) {
            var rObjects = a.getReturnValue();  
            component.set("v.recordObjects", rObjects);
            component.set("v.records", rObjects); 
            component.set("v.displayMessage", '');
            //helper.toggleShowClass(component,"showRecordsTable");           
            //helper.toggleHideClass(component,"showMessage"); 
             component.set("v.isShowMessage", false);
             component.set("v.isShowRecords", true);
        });
                               
        $A.enqueueAction(getRObjects); 
    },
    toggleHideClass:function(component, id){
        var node = component.find(id);
        $A.util.toggleClass(node,'slds-hide');
	},
    toggleShowClass:function(component, id){
        var node = component.find(id);
        $A.util.removeClass(node, 'slds-hide'); 
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
    }
})