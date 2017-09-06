({
    getBackupActivities : function(component, helper){
        var sfOrgID = component.get("v.sfOrgId");
        var action = component.get("c.getListOfBackups");
        action.setParams({ "sfOrgID" : sfOrgID});
		action.setCallback(this, function(response){
          this.getBackActivitiesResponse(component, helper, response);
        });
        $A.enqueueAction(action);
    },
    getBackActivitiesResponse: function(component, helper, response){
            component.set("v.backupactivity",response.getReturnValue());
            var ret = response.getReturnValue();
            if(ret!=undefined && ret.length>0)
            {
                helper.toggleHideClass(component,"restoreHeader");
                helper.toggleHideClass(component,"restorePage");
                helper.toggleHideClass(component,"restoreBody");
            }
            else
            {
               var toastEvent = $A.get("e.force:showToast");
               toastEvent.setParams({
                 "title": "No Backup Activities",
                 "message": "There are not records to select in restore page"
               });
               toastEvent.fire();
            }
	},
    toggleHideClass:function(component, id){
        var node = component.find(id);
        $A.util.toggleClass(node,"slds-hide");
	}
})