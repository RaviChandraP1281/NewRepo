({
	doInit : function(component, event, helper) {
        var sforgid = component.find("sforgid").get("v.value"); 
        alert('sforgid:'+sforgid);
		helper.doInit(component, event, helper);
	},
    rowChecked: function(component, event, helper) {
        if( component.get("v.showhide")=='')
        component.set("v.showhide", "slds-hide");
        else
          component.set("v.showhide", "");  
	},
    excludeFields: function(component, event, helper) {
        var objectId = event.target.id;   
        component.set("v.objectsId", objectId);
        var actualObject = component.get("v.objectData.objects");
        var fieldsata = actualObject[objectId];
        component.set("v.fieldData",fieldsata);
        
        var objectsList = component.find("objectlist");
         $A.util.addClass(objectsList,"slds-hide");
         var fieldsList = component.find("feildslist");
         $A.util.removeClass(fieldsList,"slds-hide");
	},
	checkAllCheckboxes : function(component, event, helper) {
         var target = event.getSource();
         var checkboxes = component.find("oMcheckbox");
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
    backToObjectsList:function(component, event, helper) {
        debugger;
         var actualObject = component.get("v.objectData.objects");
         actualObject[component.get("v.objectsId")] = component.get("v.fieldData");
         component.set("v.objectData.objects",actualObject);
        
         var objectsList = component.find("objectlist");
         $A.util.removeClass(objectsList,"slds-hide");
         var fieldsList = component.find("feildslist");
         $A.util.addClass(fieldsList,"slds-hide");
    }
})