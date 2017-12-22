({
	navigateToActivityObject : function(component, event, helper) {
        var objectName = event.target.id;
        var cmpEvent = component.getEvent("showObjectsSnapshot");   
        cmpEvent.setParams({
            "objectName":objectName
        });
      	cmpEvent.fire();
	},
    searchInTable: function(component, event, helper) {
        arv.searchInTable(component, event, helper);
    }, 
    loadTable:function(component, event, helper) {
        component.set("v.resultCriteria", component.get("v.snapshotDetail.resultCriteria"));
        component.set("v.searchResultCriteria", component.get("v.snapshotDetail.resultCriteria"));
    },
    doLoad:function(component, event, helper) {
        //alert('doLoad');
    	component.set("v.searchResultCriteria", component.get("v.snapshotDetail.resultCriteria"));
	}
})