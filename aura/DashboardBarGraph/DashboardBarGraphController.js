({
	doInit : function(component, event, helper) {
		helper.doInit(component, event, helper);
	},
    toggleChartData: function(component, event, helper) { 
        var a = event.getSource();
        if(a.get("v.checked")==true)
        { 
          component.set("v.graphData", [10,20,30,15,35]);
          component.set("v.graphData2", [0,0,0,5,5]);
          component.set("v.isStacked", false);
        }
        else
        {
          component.set("v.graphData", [1000, 200, 500, 700, 2345]);
          component.set("v.graphData2", [2000, 100, 100, 1400, 1060]);
          component.set("v.isStacked", true);
        }
	},
    display: function(component, event, helper) {
		 var toggleText = component.find("tooltip");
  		  $A.util.toggleClass(toggleText, "slds-hide");
	},
    objectInfoByHistoryId : function(component, event, helper) {
 		var id= event.target.getAttribute("aria-describedby");
				var cmpTarget=component.find(id).getElement();
        $A.util.removeClass(cmpTarget, 'slds-fall-into-ground');
        $A.util.addClass(cmpTarget, 'slds-rise-from-ground');
    },
    objectInfoMouseOver : function(component, event, helper) {
        var id= event.target.getAttribute("aria-describedby");	
       // var cmpTarget=component.find(id).getElement();
        var a = document.getElementById(id);
        $A.util.removeClass(a, 'slds-fall-into-ground');
        $A.util.addClass(a, 'slds-rise-from-ground');
	},
    objectInfoMouseLeave: function(component, event, helper) {
        var id= event.target.getAttribute("aria-describedby");
	//	var cmpTarget=component.find(id).getElement();
         var a = document.getElementById(id);
        $A.util.removeClass(a, 'slds-rise-from-ground');
        $A.util.addClass(a, 'slds-fall-into-ground');
	},
    navigateToMyComponent : function(component, event, helper) {
        // for non-lightning components.
        var accId = event.target.name; 
        var evt = $A.get("e.force:navigateToComponent");        
        
        evt.fire();
    }, 
    
    scriptsLoaded : function(component, event, helper) {
     //helper.graphReload(component);
    },
    showThisGraph : function(component, event, helper) {
       //helper.graphReload(component);
       debugger;
       var graph= component.find("column");
       $A.util.toggleClass(graph, "slds-hide");
        
    },
     showThisFilter : function(component, event, helper) {
       var filter= component.find("filterSidebar");
      	 $A.util.toggleClass(filter, "slds-hide");
         var column= component.find("column");
         $A.util.toggleClass(column, "slds-size_1-of-2 slds-medium-size_5-of-6 slds-large-size_9-of-12"); 
debugger;
     }
})