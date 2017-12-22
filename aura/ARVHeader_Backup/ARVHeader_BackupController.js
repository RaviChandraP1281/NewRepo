({
	showModal :  function(component, event, helper){
	//called on clicking your button
	//run your form render code after that, run the following lines
	debugger;
	helper.showPopupHelper(component, 'modaldialog', 'slds-fade-in-');
	helper.showPopupHelper(component,'backdrop','slds-backdrop--');
	},
    hidePopup:function(component,event,helper){
    	helper.hidePopupHelper(component, 'modaldialog', 'slds-fade-in-');
		helper.hidePopupHelper(component, 'backdrop', 'slds-backdrop--');
	},
    fireShowGraph : function(component, event, helper){
        
            var graphbtn = component.find("graphBtn");
         	$A.util.toggleClass(graphbtn,"slds-is-selected");
        	var cmpEvent = component.getEvent("displaygraph");
         	debugger;
        	cmpEvent.fire();    
    },
     fireShowFilter : function(component, event, helper){
          var filterbtn = component.find("filterBtn");
         $A.util.toggleClass(filterbtn,"slds-is-selected");
        	var cmpEvent = component.getEvent("displayfilter");
         	debugger;
        	cmpEvent.fire();    
    },
    
})