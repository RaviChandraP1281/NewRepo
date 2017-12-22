({
      excludeFields: function(component, event, helper) {
        var objectId = event.target.id;
        var actualObject = component.get("v.objectData");
        component.set("v.objectsId",objectId);
        let fieldData=actualObject[objectId];
        component.set("v.fieldData", actualObject[objectId]);
        debugger;
        var objectName = event.target.getAttribute("title");
        helper.doInit(component, event, helper, objectName);     
        component.set("v.currentObj",objectName);
        var objectsList = component.find("objectlist");
        $A.util.addClass(objectsList,"slds-hide");
        var fieldsList = component.find("feildslist");
        $A.util.removeClass(fieldsList,"slds-hide");
	},
      objectDatachange: function(component, event, helper) {
        console.log(event.getParam("oldValue"));
        console.log(event.getParam("value"));
        var existedConfig = component.get("v.existedConfig");
       // var uncheckedObjectData = component.get("v.uncheckedObjectData");
        var objectData = component.get("v.objectData");
        var objectUICheckboxes = component.find("oMcheckbox");
        var uncheckedObjectData=component.get("v.uncheckedObjectData");
        var checkedObjectsArray = [];
        //uncheck all
        //Mcheckbox
       // component.find("Mcheckbox").set("v.checked", false);
        //helper.checkAll(objectUICheckboxes, false, "checkAlloMcheckbox");
        if(objectData!=null && objectData!=undefined)
        {
            for(var j=0;;j++){ 
                 if(existedConfig[j]==undefined)
                 { 
                     break; 
                 }
               //comparision purpose created new array. It is easy to search in array,
               checkedObjectsArray.push(existedConfig[j].name);
                //Checking backup cfg fields                
            }
            for(var l=0;l<objectData.length;l++){
               var index = checkedObjectsArray.indexOf(objectData[l].name);
                if(index>=0){
                   objectData[l]= existedConfig[index];
                   objectData[l].isExisted=true;
                   // uncheckedObjectData[l]= undefined;
                    objectUICheckboxes[l].set("v.checked", true);
                }
                else
                {
                     objectData[l].isExisted=false;
                     objectUICheckboxes[l].set("v.checked", false);
                     // uncheckedObjectData[l]= true;
                }
            }
        }
        component.set("v.objectData", objectData);
        // Preparing unchecked objects list 
     //   component.set("v.uncheckedObjectData", uncheckedObjectData);
	},
   
	doInit : function(component, event, helper) {
	},
    fieldMaskChange : function(component, event, helper) {
        var disabled = event.getSource().get("v.disabled"); 
        var isChecked = event.getSource().get("v.checked"); 
       	var rowId = event.getSource().get("v.name"); 
        var fieldmask = component.find("maskedSet");
        if(!isChecked || disabled ==  "disabled")
        {
           // $A.util.addClass(fieldmask[rowId], "masked");
           fieldmask[rowId].set("v.disabled",true); 
        }
        else
        {
            // $A.util.removeClass(fieldmask[rowId], "masked");   
            fieldmask[rowId].set("v.disabled",false);
        }
	},
    updateDefaultMask :function(component, event, helper) {
        let maskedVal =event.getSource().get("v.value");
        let masedHead =component.get("v.maskedHead");
        if(maskedVal=="")
        {
        	event.getSource().set("v.value",masedHead);
        }
	},
    onfieldsrh: function(component, event, helper) {
        component.set("v.Spinner", true);
        let searchkey = component.find("fieldsrh").get("v.value");
        let fieldData = component.get("v.fieldData");
        let copy = [];
        for(let i=0;i<fieldData.length;i++)
        {
            let name=fieldData[i].name;
            name=name.toLowerCase();
            if(name.indexOf(searchkey.toLowerCase())>=0){
                copy.push(fieldData[i]);
            }
        }
         component.set("v.fieldDataCopy",copy);
         component.set("v.Spinner", false);
    },
    onObjectSearch: function(component, event, helper) {
        let searchkey = component.find("labelsrh").get("v.value");
        let objectData = component.get("v.objectData");
        
        let j=0;
        let copy = [];//component.set("v.objectLabelNames",copy);;
        if(searchkey!=null && searchkey!=undefined && searchkey!="" && searchkey.length>2)
        {
           for(let i=0;i<objectData.length;i++)
            {
                let name=objectData[i].name;
                name=name.toLowerCase();
                if(name.indexOf(searchkey.toLowerCase())>=0){
                    copy.push(objectData[i]);
                }
            }
         component.set("v.objectDataCopy",copy);
        } 
        else if(searchkey.length<=2)
        {
            component.set("v.objectDataCopy",objectData);
        }
    },
    fieldDataCopy: function(component, event, helper) {
        component.set("v.fieldDataCopy",component.get("v.fieldData"));
    },
    objectDataCopy: function(component, event, helper) {
        let objectData = component.get("v.objectData");
        component.set("v.objectDataCopy",objectData);
       /* let copy = [];
            for(let i=0;i<objectData.length;i++)
            {
                copy.push(objectData[i].name);
            }     
      component.set("v.objectLabelNames",copy);*/
    },
   rowChecked: function(component, event, helper) {
        if( component.get("v.showhide")=='')
        component.set("v.showhide", "slds-hide");
        else
          component.set("v.showhide", "");  
	},
  
	checkAlloMcheckbox : function(component, event, helper) {
         var checkboxes = component.find("oMcheckbox");
         let isChecked = event.getSource().get("v.checked");
         helper.checkAll(component, checkboxes, isChecked, "checkAlloMcheckbox");
        // helper.prepareUnchecked(component, helper, checkboxes, isChecked);
    },
     objectCheckboxChange:function(component, event, helper) {
        var isChecked = event.getSource().get("v.checked"); 
       	var rowId = event.getSource().get("v.name"); 
      	helper.prepareUncheckedObjects(component, helper, isChecked, rowId);
        
        var excludeCount = component.find("excludeCount");
        var excludeCountTemp = component.find("excludeCountTemp");
        var ele =excludeCount[rowId];
        var eleTemp =excludeCountTemp[rowId];
         if(isChecked){
             $A.util.removeClass(ele, "slds-hide");
             $A.util.addClass(eleTemp, "slds-hide");
         }
         else
         { 
             $A.util.addClass(ele, "slds-hide");
             $A.util.removeClass(eleTemp, "slds-hide");
         }
	},
    checkAllFieldCheckboxes : function(component, event, helper) {
        debugger;
         var target = event.getSource();
         var checkboxes = component.find("fMcheckbox");
     	 helper.checkAll(component, checkboxes, target.get("v.checked"),"other");
         var fieldmask = component.find("fieldmask");
       	 var fieldencrypted = component.find("fieldencrypted");
         var maskedSet = component.find("maskedSet");
         if(target.get("v.checked") ==  true)
         {
                  for(var i=0;i<checkboxes.length;i++){             
                    fieldmask[i].set("v.disabled","");
                    fieldencrypted[i].set("v.disabled","");
                }
        }
        else
        { 	
            for(var i=0;i<checkboxes.length;i++){     
                fieldmask[i].set("v.checked",false);
                fieldencrypted[i].set("v.checked",false);
                
              	fieldmask[i].set("v.disabled","disabled");
                fieldencrypted[i].set("v.disabled","disabled"); 
                maskedSet[i].set("v.disabled",true);
                //$A.util.addClass(maskedSet[i], "masked");   
             }
         } 
    },
   backToObjectsList:function(component, event, helper) {
        helper.backToObjects (component, event, helper);    
   },
    saveAndBackToObjectsList:function(component, event, helper) {
         var actualObject = component.get("v.objectDataCopy");
        //Exclude list preparationexcludeFields
        debugger;
         actualObject[component.get("v.objectId")].encryptedfields= helper.getExcludedList(component, "fieldencrypted", true);
         actualObject[component.get("v.objectId")].excludedFields= helper.getExcludedList(component,"fMcheckbox", false);
     	
        var maskedList= helper.getMaskedList(component, "fieldmask", true);
        actualObject[component.get("v.objectId")].maskedfields=maskedList.maskedfields;
        actualObject[component.get("v.objectId")].maskedvalues=maskedList.maskedvalues;
        debugger;
         component.set("v.objectData",actualObject);
         helper.backToObjects (component, event, helper);    
    },
     fieldCheckboxChange :function(component, event, helper) {
    		var checkbox = event.getSource().get("v.checked"); 
       	   	var rowId = event.getSource().get("v.name"); 
         	var fieldmask = component.find("fieldmask");
       	    var fieldencrypted = component.find("fieldencrypted");
            var maskedSet = component.find("maskedSet");
         	if(checkbox ==  true)
            {
                fieldmask[rowId].set("v.disabled","");
                fieldencrypted[rowId].set("v.disabled","");
                
            }
         	else
         	{ 	
                fieldmask[rowId].set("v.checked",false);
                fieldencrypted[rowId].set("v.checked",false);
                
              	fieldmask[rowId].set("v.disabled","disabled");
                fieldencrypted[rowId].set("v.disabled","disabled");
                maskedSet[rowId].set("v.disabled",true);
                
              //  $A.util.addClass(maskedSet[rowId], "masked");   
                              
         	}
	}
})