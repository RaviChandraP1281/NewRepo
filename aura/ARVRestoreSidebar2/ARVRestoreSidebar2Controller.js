({
	handleInit : function(component, event, helper) {
       /* var YearOptions = new Object{"2017","2016"};
        var MonthOptions = new Object{"January","February","March","April","May","June", "July", "August", "September", "October", "November","December"};
        component.set("v.YearOptions", YearOptions);
        component.set("v.MonthOptions", MonthOptions);
        */
    },
    goBackupFilter : function(component, event, helper) {
        debugger;
		var sfOrgId = component.get("v.sfOrgId");
        var yearValue = component.find("YearObjects").get("v.value");
        var monthValue = component.find("MonthObjects").get("v.value");
        var fDateField = component.find("fromDate").get("v.value");
        var tDateField = component.find("toDate").get("v.value");
        
        var getBObjects = component.get("c.getBackupsForRestore");
        getBObjects.setParams({ 
            "sfOrgID" : sfOrgId,
            "sYear": yearValue, 
            "sMonth":monthValue, 
            "sFromDate":fDateField, 
            "sToDate":tDateField
        });            
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();
            component.set("v.backupObjects", bObjects);
          //  component.set("v.backupactivity", bObjects);
            
           var cmpEvent = component.getEvent("goBackupActivitiesByFilter");;
            cmpEvent.setParams({
                "backupactivity":bObjects
            });
       		cmpEvent.fire(); 
        });
                               
        $A.enqueueAction(getBObjects); 
        
	}
})