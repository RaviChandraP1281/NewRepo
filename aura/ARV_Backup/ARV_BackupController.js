({
    historyGraphLoad : function(component, event, helper) {
        helper.getOrgsList(component,helper);
        helper.toggleHide(component,"inprogressChartDiv");
	},
    toggleChartData: function(component, event, helper) { 
        helper.toggleHide(component,"historyChartDiv");
        helper.toggleHide(component,"historyDiv");
        helper.toggleHide(component,"inprogressChartDiv");
        helper.toggleHide(component,"inprogressDiv");
        helper.orgIdChanged(component, event, helper) ;
	},
    display: function(component, event, helper) {
	   helper.toggleHide(component,"tooltip");
	},
    objectInfoByHistoryId : function(component, event, helper) {
 		var id= event.target.getAttribute("aria-describedby");
		var cmpTarget=component.find(id).getElement();
        $A.util.removeClass(cmpTarget, 'slds-fall-into-ground');
        $A.util.addClass(cmpTarget, 'slds-rise-from-ground');
    },
    objectInfoMouseOver : function(component, event, helper) {
        var id= event.target.getAttribute("aria-describedby");	
        var a = document.getElementById(id);
        $A.util.removeClass(a, 'slds-fall-into-ground');
        $A.util.addClass(a, 'slds-rise-from-ground');
	},
    objectInfoMouseLeave: function(component, event, helper) {
        var id= event.target.getAttribute("aria-describedby");
         var a = document.getElementById(id);
        $A.util.removeClass(a, 'slds-rise-from-ground');
        $A.util.addClass(a, 'slds-fall-into-ground');
	},
    showThisGraph : function(component, event, helper) {
         helper.toggleHide(component,"sd");
    },
    showThisFilter : function(component, event, helper) {
         helper.toggleHide(component,"filterSidebar");
         var historytoggle= component.find("historytoggle");
         var column= component.find("column");
         $A.util.toggleClass(column, "slds-size_1-of-2 slds-medium-size_5-of-6 slds-large-size_9-of-12"); 
    	 $A.util.toggleClass(historytoggle, "slds-hide");
     },
    activityObjects : function(component, event, helper) {
    	helper.toggleHide(component,"activitiesList");
        helper.toggleHide(component,"activityObjects");
     },
    orgIdChanged:function(component, event, helper) {
      helper.orgIdChanged(component, event, helper) ;
    }
})