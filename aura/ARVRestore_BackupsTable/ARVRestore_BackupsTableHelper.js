({
    getRecordsPerFilter : function(component){
        var sfOrgID = component.get("v.sfOrgId");
        var backupID = component.get("v.backupID");
        var action = component.get("c.getRecordsPerFilter");
        action.setParams({ 
            "sfOrgID" : "00D6F000001OOISUA4", 
            "backupID": "1001", 
            "objName": "", 
            "fieldName": "", 
            "customField":""
        });
		action.setCallback(this, function(response) {
            component.set("v.records",response.getReturnValue());
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
        $A.util.toggleClass(node,"slds-hide");
	},
    getCheckedItems:function(component, id){
        var userConfirmedActivities=[];
             var backedupRecords = component.find(id);
             for(var j=0;j<backedupRecords.length;j++){
                if(backedupRecords[j].get("v.checked") == true){
                    userConfirmedActivities.push({"id":backedupRecords[j].get("v.name")});
                }
            }
        return userConfirmedActivities;
    }
})