({
     containsRegex : function(a, regex){
        for(var i in a) {
            let strA = ""+a[i];
            strA=strA.toLowerCase();
            regex= regex.toLowerCase();
            if(strA.search(regex) > -1){
              return 1;
          }
        }        return -1;
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
    isExistRegex : function(a, regex){
        for(var i in a) {
            let strA = ""+a[i];
            strA=strA.toLowerCase();
            regex= regex.toLowerCase();
            if(strA.indexOf(regex) > -1){
              return 1;
          }
        }
        return -1;
    },
    checkAll:function(component, checkboxes, isChecked, other){
            if(isChecked == true){
                for (var i = 0; i < checkboxes.length; i++){
                    checkboxes[i].set("v.checked",true);
                }
             }else{
                 for (var i = 0; i < checkboxes.length; i++){
                   checkboxes[i].set("v.checked",false);
                 }}  
    },
    isUncheckDisableToggle : function(component, id, i){
         var toggleId = component.find(id);
         toggleId[i].set("v.checked",false);
         toggleId[i].set("v.disabled",true);
    },
    getMaskedList:function(component, checkboxName, isChecked){
        var checkboxes = component.find(checkboxName);
         var maskedSet=component.find("maskedSet");
        var maskedfields=[],maskedvalues=[];
    	var excludedFields = [];
        if(checkboxes!=undefined){
         	 for (var i = 0; i < checkboxes.length; i++){
                 if(checkboxes[i].get("v.checked")==isChecked){                     
                        debugger;
                        var a=checkboxes[i].get("v.value");
                        maskedfields.push(a);
                        var obj = {};
                        obj[a]=maskedSet[i].get("v.value");
                       maskedvalues.push(obj);
                 }
             }
        }
        debugger;
        excludedFields.maskedfields=maskedfields;
        excludedFields.maskedvalues=maskedvalues;
        return excludedFields;
    },
    getExcludedList:function(component, checkboxName, isChecked){
        var checkboxes = component.find(checkboxName);
    	var excludedFields = [];
        	 for (var i = 0; i < checkboxes.length; i++){
                 if(checkboxes[i].get("v.checked")==isChecked){
                   excludedFields.push(checkboxes[i].get("v.value"));
                 }
             }
        return excludedFields;
    },
    backToObjects:function(component, event, helper){
      var objectsList = component.find("objectlist");
         $A.util.removeClass(objectsList,"slds-hide");
         var fieldsList = component.find("feildslist");
         $A.util.addClass(fieldsList,"slds-hide");   
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
        component.set("v.fieldData",jsonData);// After UI render completed. It should run below lines. Not sure how to 
         var objectId = event.target.id;
        //var actualObject = component.get("v.objectData");
         component.set("v.objectId",objectId);
         //var objectId = component.get("v.objectData");
         var actualObject = component.get("v.objectData");
         helper.setMaskedFieldConfig(component, helper, "fieldmask", actualObject[objectId], true);
         helper.setPreviousFieldValues(component, helper, "fieldencrypted", actualObject[objectId].encryptedfields, true);
         helper.setPreviousFieldValues(component, helper, "fMcheckbox", actualObject[objectId].excludedFields, false);
            
        //component.set("v.loadFieldConfig",true);
    },
    setMaskedFieldConfig:function(component, helper, checkboxId, maskedfields, isChecked){
        var checkboxes = component.find(checkboxId);
        var maskedSet = component.find("maskedSet");
        var fields =maskedfields.maskedfields;
        var maskedValues =maskedfields.maskedvalues;
        if(checkboxes!=null && checkboxes!=undefined)
        {
            for (var i = 0; i < checkboxes.length; i++){
                 	 if(fields!=null && fields!=undefined && fields.length>0 
                        && fields.indexOf(checkboxes[i].get("v.value"))>=0){
                     checkboxes[i].set("v.checked",isChecked);
                     maskedSet[i].set("v.disabled",false);
                     if(isChecked && maskedValues!=undefined)
                         {   
                             var val="";
                             for(var j=0;maskedValues.length>j;j++){
                              try{     
                                    let keyName=Object.keys(maskedValues[j])[0];
                                    if(keyName==checkboxes[i].get("v.value")){
                                     val=maskedValues[j][checkboxes[i].get("v.value")];
                                     ++j;
                                 }  maskedSet[i].set("v.value", val);
                                  }
                                 catch(e){
                                     
                                 }
                             }
                         }
                         
                         }
                
                         }
                    
       			}
            }
        }
    },
    prepareUncheckedObjects:function(component, helper, isChecked, rowId){
          var uncheckedObjectData=component.get("v.uncheckedObjectData");
         	if(isChecked ==  true)
            {
        		uncheckedObjectData[rowId]= undefined;
            }
       		else{
        		uncheckedObjectData[rowId]= true;
        	}
        component.set("v.uncheckedObjectData", uncheckedObjectData);
    },
    
    prepareUnchecked:function(component, helper, checkboxes, isChecked) {
        if(checkboxes!=undefined)
        {
            var uncheckedObjectData=component.get("v.uncheckedObjectData");
            for(let i=0;i<checkboxes.length;i++)
            {
                if(isChecked ==  true)
                {
                    uncheckedObjectData[i]= undefined;
                }
                else{
                    uncheckedObjectData[i]= true;
                }               
            }
             component.set("v.uncheckedObjectData", uncheckedObjectData);
        }
        
    },
})