({
    doInit : function(component, event, helper) {
		helper.getOrgsList(component, event, helper);
        helper.getCurentTime(component);
    },
    getOrgDetails: function(component, event, helper) {
        var orgDetails = event.getParam("orgDetails");
        component.set("v.Org",orgDetails);
        helper.toggleOrgs(component);
    },
	newOrgButtonclicked : function(component, event, helper) {
		helper.toggleOrgs(component);
	},
    getbacktoOrgList : function(component, event, helper) {
		helper.toggleOrgs(component);
	},
    sforgauthsucess: function(component, event, helper) {
		helper.getObjectsByOrgId(component, event, helper);
        var schedule=component.find("schedule");
        $A.util.removeClass(schedule, "slds-hide");
	},
     showSpinner: function(component, event, helper) {
       // make Spinner attribute true for display loading spinner 
        component.set("v.Spinner", true); 
   },
    hideSpinner : function(component,event,helper){
     // make Spinner attribute to false for hide loading spinner    
       component.set("v.Spinner", false);
    },
    handleClick:function(component,event,helper){
        var idSforg= component.get("v.idSforg");
        var flScdFrq= component.get("v.flScdFeq");
        var dayScheduled= component.get("v.dayScd");
        var objCriteria= component.get("v.objectData");
        var idUser= component.get("v.idUser");
        var datePill= component.get("v.dtScd");
        var tmScd= component.get("v.currentTime");
        
        if(datePill!=undefined)
        for(var a=0;a<datePill.length;a++){
            dtScd+=datePill[a];
            if(a<datePill.length-1){
               dtScd+=",";
            }
        }
        var dtScd="";
        if(flScdFrq == "daily"){
            dtScd = "";
            dayScheduled="";
            flScdFrq="D";
        }else if(flScdFrq == "weekly"){
              dtScd = "";
            flScdFrq="W";
        }else{
            dayScheduled="";
            flScdFrq="M";
        }
        
        //delete unselected objects list
        var uncheckedObjectData = component.get("v.uncheckedObjectData");
         for (var i = 0; i < uncheckedObjectData.length; i++){
             if(uncheckedObjectData[i]==true){
                 delete objCriteria[i];
             }
         }
   		helper.saveBackupConfig(component, helper, idSforg, flScdFrq, dayScheduled, objCriteria, idUser,dtScd, tmScd);
	}
})