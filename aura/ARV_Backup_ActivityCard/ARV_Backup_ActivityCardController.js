({
    leftMove: function(component, event, helper){
       arv.leftMove(component, event, helper);
    },
    rightMove: function(component, event, helper) {
       arv.rightMove(component, event, helper);
    },
    sortTable: function(component, event, helper) {
       arv.sortTable(component, event, helper);
    },
	searchInTable: function(component, event, helper) {
      arv.searchInTable(component, event, helper);
    },
    backToDashboard : function(component, event, helper) {
		var cmpEvent = component.getEvent("returnToDashboard");   
       	cmpEvent.fire();
	}
})