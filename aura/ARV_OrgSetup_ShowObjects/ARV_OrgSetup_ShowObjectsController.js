({
	doInit : function(component, event, helper) {
	},
    rowChecked: function(component, event, helper) {
        if( component.get("v.showhide")=='')
        component.set("v.showhide", "slds-hide");
        else
          component.set("v.showhide", "");  
	},
    excludeFields: function(component, event, helper) {
        var objectId = event.target.id;
        var actualObject = component.get("v.objectData");
        component.set("v.objectsId",objectId);
        component.set("v.fieldData", actualObject[objectId]);
        var objectName = event.target.getAttribute("title");
        helper.doInit(component, event, helper, objectName);     
       component.set("v.currentObj",objectName);
        var objectsList = component.find("objectlist");
         $A.util.addClass(objectsList,"slds-hide");
         var fieldsList = component.find("feildslist");
         $A.util.removeClass(fieldsList,"slds-hide");
	},
	checkAllCheckboxes : function(component, event, helper) {
         var target = event.getSource();
         var checkboxes = component.find("oMcheckbox");
         helper.checkAll(checkboxes, target);
    },
    checkAllFieldCheckboxes : function(component, event, helper) {
         var target = event.getSource();
         var checkboxes = component.find("fMcheckbox");
     	 helper.checkAll(checkboxes, target);
        
           	var fieldmask = component.find("fieldmask");
       	    var fieldencrypted = component.find("fieldencrypted");
         	if(target.getSource().get("v.checked") ==  true)
            {
                  for(var i=0;i<objectData.length;i++){             
                    fieldmask[i].set("v.disabled","");
                    fieldencrypted[i].set("v.disabled","");
                  }
            }
         	else
         	{ 	
                 for(var i=0;i<objectData.length;i++){     
                fieldmask[i].set("v.checked",false);
                fieldencrypted[i].set("v.checked",false);
                
              	fieldmask[i].set("v.disabled","disabled");
                fieldencrypted[i].set("v.disabled","disabled"); 
                 }
         	} 
    },
    objectCheckboxChange:function(component, event, helper) {
        var checkbox = event.getSource().get("v.checked"); 
       	var rowId = event.getSource().get("v.name"); 
        var uncheckedObjectData=component.get("v.uncheckedObjectData");
         	if(checkbox ==  true)
            {
        		uncheckedObjectData[rowId]= undefined; //true contained objects removed 
            }
       		else{
        		uncheckedObjectData[rowId]= true; //true contained objects removed 
        	}
        component.set("v.uncheckedObjectData", uncheckedObjectData);
	},
    backToObjectsList:function(component, event, helper) {
         var actualObject = component.get("v.objectData");
        debugger;
        //Exclude list preparationexcludeFields
         actualObject[component.get("v.objectsId")].encryptedfields= helper.getExcludedList(component, component.find("fieldencrypted"), true);
         actualObject[component.get("v.objectsId")].excludedFields= helper.getExcludedList(component, component.find("fMcheckbox"), false);
     	 actualObject[component.get("v.objectsId")].maskedfields= helper.getExcludedList(component, component.find("fieldmask"), true);
         component.set("v.objectData",actualObject);
        
         var objectsList = component.find("objectlist");
         $A.util.removeClass(objectsList,"slds-hide");
         var fieldsList = component.find("feildslist");
         $A.util.addClass(fieldsList,"slds-hide");        
    },
     fieldCheckboxChange :function(component, event, helper) {
    		var checkbox = event.getSource().get("v.checked"); 
       	   	var rowId = event.getSource().get("v.name"); 
         	var fieldmask = component.find("fieldmask");
       	    var fieldencrypted = component.find("fieldencrypted");
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
         	}
	}
})