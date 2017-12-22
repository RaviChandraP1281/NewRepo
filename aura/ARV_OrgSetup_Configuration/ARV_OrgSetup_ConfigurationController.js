({
    doInit : function(component, event, helper) {
		helper.getOrgsList(component, event, helper);
        helper.getCurentTime(component);
    },
    onload: function(component, event, helper) {
        arv.setUIChanges(component,helper);
    },
    authAccordinClose: function(component, event, helper) {
        helper.authAccordinClose(component, event, helper);
    },
    getOrgDetails: function(component, event, helper) {
        var isExistedOrg = event.getParam("isExistedOrg");
        var orgDetails = event.getParam("orgDetails");
        debugger;
        component.set("v.Org",orgDetails);
        helper.toggleOrgs(component, helper);
        helper.changeHeaderBtn(component, event, helper);
        component.set("v.headerSaveBtn","Update");
        component.set("v.isgetFetchObjects",true);
    },
	newOrgButtonclicked : function(component, event, helper) {
        let orgDetails={
            "authtype":"new"
        };
        component.set("v.isgetFetchObjects",false);
        component.set("v.Org",orgDetails);
        helper.getbacktoOrgList(component, event, helper);
        helper.authAccordinClose(component, event, helper);
	},
    getbacktoOrgList : function(component, event, helper) {
          helper.getbacktoOrgList(component, event, helper);
	},
    sforgauthsucess: function(component, event, helper) {
        component.set("v.loadingMsg", "Fetching objects from salesforce");
		helper.getObjectsByOrgId(component, event, helper);
	},
     showSpinner: function(component, event, helper) {
        component.set("v.Spinner", true); 
   },
    hideSpinner : function(component,event,helper){   
       component.set("v.Spinner", false);
    },
    handleClick:function(component,event,helper){
        helper.saveInfo(component,event,helper);
        var idSforg= component.get("v.idSforg");
        var flScdFrq= component.get("v.flScdFeq");
        var dayScheduled= component.get("v.dayScd");
        var objCriteria= component.get("v.objectData");
        var idUser= component.get("v.idUser");
        var datePill= component.get("v.dtScd");
        var tmScd= component.get("v.currentTime");
        
        var dtScd="";
        if(datePill!=undefined)
        for(var a=0;a<datePill.length;a++){
            dtScd+=datePill[a];
            if(a<datePill.length-1){
               dtScd+=",";
            }
        }
        if(flScdFrq == "D"){
            dtScd = "";
            dayScheduled="";
        }
        else if(flScdFrq == "W"){
              dtScd = "";
        }
            else{
            dayScheduled="";
        }
        debugger;
        //delete unselected objects list
        var copyObjectCriteria =[];
        var uncheckedObjectData = component.get("v.uncheckedObjectData");
         for (var i = 0,j=0; i < objCriteria.length; i++){
             if(uncheckedObjectData[i]!=true){
                 copyObjectCriteria[j] = objCriteria[i];
                 j++;
             }
         }
        if(copyObjectCriteria.length>0){
   		helper.saveBackupConfig(component, event, helper, 
                                idSforg, flScdFrq, dayScheduled, 
                                copyObjectCriteria, idUser,dtScd, tmScd);
        }
        else
        {
            helper.toastMsg("", "Must have to select atlest one object to Save backup","warning");
        }
        helper.cleanPreviousState(component,event,helper);
       
    }
})