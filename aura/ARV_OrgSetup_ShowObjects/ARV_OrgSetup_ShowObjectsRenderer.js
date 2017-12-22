({
	afterRenderer  : function(component, component){
    this.superAfterRender();
        debugger;
        if(component.get("v.loadFieldConfig")){
         var objectId = component.get("v.objectData");
         var actualObject = component.get("v.objectId");
            helper.setMaskedFieldConfig(component, helper, "fieldmask", actualObject[objectId], true);
           // helper.setPreviousFieldValues(component, helper, "fieldmask", actualObject[objectId].maskedfields, true);
            helper.setPreviousFieldValues(component, helper, "fieldencrypted", actualObject[objectId].encryptedfields, true);
            helper.setPreviousFieldValues(component, helper, "fMcheckbox", actualObject[objectId].excludedFields, false);
            component.set("v.loadFieldConfig", false);
        }
	}
})