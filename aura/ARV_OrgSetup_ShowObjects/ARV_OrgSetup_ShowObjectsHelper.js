({
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
    uncheckedObjects:function(component, event){
        var isChecked= event.getSource().get("v.checked");
          var objectData= component.find("v.objectData");
          var uncheckedObjectData= component.find("v.uncheckedObjectData");
        if(isChecked == true){
            for(var i=0;i<objectData.length;i++){              
                uncheckedObjectData[i] = undefined;
              }
        }
        else
        {
            for(var i=0;i<objectData.length;i++){              
                uncheckedObjectData[i] = true;
              }
        }
        
    },
    setPreviousFieldValues:function(component, helper, checkboxId, valuesSet, isChecked){
        var checkboxes = component.find(checkboxId);
        if(checkboxes!=null && checkboxes!=undefined)
        {
            for (var i = 0; i < checkboxes.length; i++){
           		 if(valuesSet!=null && valuesSet.length>0 && valuesSet.indexOf(checkboxes[i].get("v.value"))>=0){
                 	 if(checkboxId=="fMcheckbox")
                     {
                         if(!isChecked)
                         {
                            helper.isUncheckDisableToggle(component,"fieldmask", i);
                            helper.isUncheckDisableToggle(component,"fieldencrypted", i);
                         }
                     }
                     checkboxes[i].set("v.checked",isChecked);
       			}
            }
        }
    },
    isUncheckDisableToggle : function(component, id, i){
         var toggleId = component.find(id);
         toggleId[i].set("v.checked",false);
         toggleId[i].set("v.disabled",true);
    },
    getExcludedList:function(component, checkboxes, isChecked){
    		var excludedFields = [];
        	 for (var i = 0; i < checkboxes.length; i++){
                 if(checkboxes[i].get("v.checked")==isChecked){
        			excludedFields.push(checkboxes[i].get("v.value"));
                 }
             }
        return excludedFields;
    },
	doInit : function(component, event, helper, objectName) {
        helper.getSampleJSON(component, event, helper, objectName);
	},
    
    getSampleJSON : function(component, event, helper, objectName){
        var action = component.get("c.getSfFields");
         action.setParams({ 
            "sfOrgID" : component.get("v.idSforg"),
             "sfObjName":objectName
         });
        action.setCallback(this, function(response) {
            this.doLayout(response, component, event, helper);
        });
        $A.enqueueAction(action);
    },
    doLayout:function(response, component, event, helper)
    {
        var jsonData = response.getReturnValue();
        component.set("v.fieldData",jsonData);
        var objectId = event.target.id;
        var actualObject = component.get("v.objectData");
        console.log(actualObject); 
        helper.setPreviousFieldValues(component, helper, "fieldmask", actualObject[objectId].maskedfields, true);
        helper.setPreviousFieldValues(component, helper, "fieldencrypted", actualObject[objectId].encryptedfields, true);
        helper.setPreviousFieldValues(component, helper, "fMcheckbox", actualObject[objectId].excludedFields, false);
       
 	}
})