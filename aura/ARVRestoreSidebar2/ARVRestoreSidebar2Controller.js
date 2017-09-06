({
	handleInit : function(component, event, helper) {
       /* var YearOptions = new Object{"2017","2016"};
        var MonthOptions = new Object{"January","February","March","April","May","June", "July", "August", "September", "October", "November","December"};
        component.set("v.YearOptions", YearOptions);
        component.set("v.MonthOptions", MonthOptions);
        */
    },
    goBackupFilter : function(component, event, helper) {
		var objectName = component.find("YearObjects").get("v.value");
        var fieldName = component.find("MonthObjects").get("v.value");
        var fDateField = component.find("fromDate").get("v.value");
        var tDateField = component.find("toDate").get("v.value");
        
        alert(objectName+':'+fieldName+':'+fDateField+':'+tDateField);
        var getBObjects = component.get("c.getBackupsPerFilter");
        getBObjects.setParams({ "sfOrgID" : "00D6F000001OOISUA4", 
                                "backupYear" : objectName, 
                                "backupMonth": fieldName, 
                                "fromDate": fDateField, 
                                "toDate": tDateField});
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();  
            component.set("v.backupObjects", bObjects);
            component.set("v.backupactivity", bObjects);
        });
                               
        $A.enqueueAction(getBObjects); 
	}
})