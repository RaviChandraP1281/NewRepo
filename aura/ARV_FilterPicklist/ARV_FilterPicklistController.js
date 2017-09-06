({
	handleInit : function(component, event, helper) {
        var getObjects = component.get("c.getFObjectsPerBackup");
        getObjects.setParams({ "sfOrgID" : "00D6F000001OOISUA4", "backupID" : "1001"});
        getObjects.setCallback(this, function(a) {
            var objects = a.getReturnValue();  // Array<Object>
            // Construct the list of Account picklist options
            debugger;
            var objectOptions = [];
            
            // Construct the map of dependent Contact picklist
            // options, keyed on Account ID values
            var fieldOptionsByName = new Object();
            objects.forEach(function(element, index, array) {
                var objName = element.name;
                // If the contact's Account is new to us
                if (fieldOptionsByName[objName] === undefined) {
                    
                    // Add the Account as an option for the
                    // Account picklist
                    var objectOption = new Object();
                    objectOption.name = element.name;
                    objectOption.value = element.name;
                    objectOptions.push(objectOption);
                    
                    // Construct an empty array to initialize
                    // the list of dependent Contact picklist options
                    fieldOptionsByName[objName] = [];
                }
                var fields = element.fields;
                var fieldOptions = [];
                fields.forEach(function(felement, findex, farray) {
                
                    var fieldName = felement.fieldName;
                    if (fieldOptionsByName[objName] === undefined) {
                        
                        // Add the Account as an option for the
                        // Account picklist
                        var fieldOption = new Object();
                        fieldOption.name = felement.fieldName;
                        fieldOption.value = felement.fieldName;
                        fieldOptions.push(fieldOption);
                        
                        // Construct an empty array to initialize
                        // the list of dependent Contact picklist options
                        fieldOptionsByName[objName] = [];
                    }
               
                var fieldOption = new Object();
                fieldOption.name = felement.fieldName;
 				//fieldOption.label = objName;               
                fieldOptionsByName[objName].push(fieldOption);
            });    
                    
                
            });
            component.set("v.objectOptions", objectOptions);
            component.set("v.objectjson",fieldOptionsByName);
            if(objectOptions.length>0)
            {
               component.set("v.selectedObjectInFilter",  objectOptions[0].name);
            }
            
        });
        $A.enqueueAction(getObjects);      
    },
    handleObjectChange : function(component, event, helper) {
        debugger;
          var objects = component.find("objects").get("v.value");
          component.set("v.selectedObjectInFilter", objects);
        // Get a reference to the dependent picklist
        var selectFields = component.find("fields");
        var objectsArr  = component.get("v.objectjson");
        component.set("v.fieldOptions",
            objectsArr[0][event.getSource().get("v.value")]);
    }, 
    goRecordFilter : function(component, event, helper) {
        var objectName = component.find("objects").get("v.value");
        var fieldName = component.find("fields").get("v.value");
        //alert(objectName+':'+fieldName);
        var getRObjects = component.get("c.getRecordsPerFilter");
        getRObjects.setParams({ "sfOrgID" : "00D6F000001OOISUA4", "backupID" : "1001", "objName": "", "fieldName": "", "customField": ""});
        getRObjects.setCallback(this, function(a) {
            var rObjects = a.getReturnValue();  
            component.set("v.recordObjects", rObjects);
            component.set("v.records", rObjects);
        });
                               
        $A.enqueueAction(getRObjects); 
    }
})