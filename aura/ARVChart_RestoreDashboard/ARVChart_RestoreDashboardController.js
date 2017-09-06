({
	showThisGraph : function(component, event, helper) {
       //helper.graphReload(component);
       debugger;
       var graph= component.find("sd");
       $A.util.toggleClass(graph, "slds-hide");
    }
})