({
     doInit: function(component, event, helper){
        var  orgId = component.get("v.sfOrgId");
   		helper.everyMinute(component, event, helper, orgId);
         document.body.setAttribute('style', 'overflow: hidden;');
	},
    showRestoreTable : function(component, event, helper) {
        helper.toggleHide(component,"restoreHeader");
        helper.toggleHide(component,"restoreObject");
        helper.doLoadRestoreObject(component, event, helper);
    },
    showThisGraph : function(component, event, helper) {
         helper.toggleHide(component,"sd");
    },
    showTheRecords : function(component, event, helper) {
      helper.toggleHideClass(component,"showrecords");
      helper.toggleHideClass(component,"showfields");
	},
    returnToDashboard:function(component, event, helper) {
        helper.toggleHide(component,"restoreHeader");
        helper.toggleHide(component,"restoreObject");
    },
    backToObjects : function(component, event, helper) {
      helper.toggleHideClass(component,"showbackups");
      helper.toggleHideClass(component,"showrecords");
    },
    showTheBackups : function(component, event, helper) {
      helper.showSpinner(component, helper);
      helper.getBackupActivities(component, helper);
	},
    backToRestore : function(component, event, helper) {
      helper.toggleHideClass(component,"restoreHeader");
      helper.toggleHideClass(component,"restoreBody");
      helper.toggleHideClass(component,"restorePage");
    },
    historyGraphLoad : function(component, event, helper) {
        helper.getOrgsList(component,event, helper);
        helper.toggleHide(component,"inprogressChartDiv");
	},
    orgIdChanged:function(component, event, helper) {
        debugger;
        var orgId=event.getParam("sfOrgId");
       component.set("v.sfOrgId",orgId);
       helper.orgIdChanged(component, event, helper) ;
    },
    toggleChartData: function(component, event, helper) { 
        var isInProgress = event.getParam("isInprogress");
        component.set("v.isProgress",isInProgress);
        
        helper.toggleChartData(component, event, helper, isInProgress);
        helper.backupChange(component, event, helper);
    },
    showThisFilter : function(component, event, helper) {
//helper.toggleHide(component,"filterSidebar");
//       //  var historytoggle= component.find("historytoggle");
       //  var column= component.find("column");
       //  $A.util.toggleClass(column, "slds-size_1-of-2 slds-medium-size_5-of-6 slds-large-size_9-of-12"); 
    //	 $A.util.toggleClass(historytoggle, "slds-hide");
     },
     updatechart:function(component, event, helper) {
        helper.updateChart(component, event, helper);
    },
    confirmRestore: function(component, event, helper) {
    }
})