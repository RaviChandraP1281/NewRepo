({
    doInit: function(component, event, helper){
        component.set("v.data",[]);
        component.set("v.Spinner", true);
        var  orgId = component.get("v.sfOrgId");
   		helper.everyMinute(component, event, helper, orgId);
	},
    refresh: function(component, event, helper){
         component.set("v.Spinner", true);
         var  orgId = component.get("v.sfOrgId");
    	 helper.getBackupActivity(component, helper, orgId);
    },
    historyGraphLoad : function(component, event, helper) {
        arv.setUIChanges(component,helper);
	},
    toggleChartData: function(component, event, helper) { 
        var isInprogress = event.getParam("isInprogress");
        component.set("v.isInprogressBackup",isInprogress);
        if(isInprogress)
        {
      	  component.set("v.chartType","column");
        }
        else
        {
           component.set("v.chartType","line");
        }
        helper.toggleChartData(component, event, helper, isInprogress);
        helper.backupChange(component, event, helper);
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
         var column= component.find("column");
         $A.util.toggleClass(column, "slds-size_1-of-2 slds-medium-size_5-of-6 slds-large-size_9-of-12"); 
     },
   /* activityObjects : function(component, event, helper) {
    	helper.toggleHide(component,"activitiesList");
        helper.toggleHide(component,"activityObjects");
        helper.doLoadActivityObject(component, event, helper);
     },*/
    activityObjects : function(component, event, helper) {
        helper.doLoadActivityObject(component, event, helper);
     },
    backupChange:function(component, event, helper) {
        helper.backupChange(component, event, helper);
	},
    orgIdChanged:function(component, event, helper) {     
       component.set("v.Spinner",true);
       var orgId=event.getParam("sfOrgId");
       component.set("v.sfOrgId",orgId);
       helper.orgIdChanged(component, event, helper);
    },
    returnToDashboard:function(component, event, helper) {
        helper.toggleHide(component,"activitiesList");
        helper.toggleHide(component,"activityObjects");
    },
    updatechart:function(component, event, helper) {
        helper.updateChart(component, event, helper);
    }
})