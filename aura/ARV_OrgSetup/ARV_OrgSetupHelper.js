({
	toggleOrgs : function(component) {
		var takebackup = component.find("takebackup");
        $A.util.toggleClass(takebackup, "slds-hide");
        var orglist = component.find("orglist");
        $A.util.toggleClass(orglist, "slds-hide");
	},
    getCurentTime : function(component){
  		var dateFormat = "hh:mm";
		var dateString = $A.localizationService.formatDateTime(new Date(), dateFormat);
        component.set("v.currentTime",dateString);          
	},
    getObjectsByOrgId : function(component, event, helper) {
        var sfOrgID = event.getParam("sfOrgID");
        helper.getObjectsByOrgService(component, sfOrgID);
	},
    getObjectsByOrgService : function(component, sfOrgID){
        var action = component.get("c.getSfObjects");
         action.setParams({ 
            "sfOrgID" : sfOrgID
         });
        action.setCallback(this, function(response) {
            this.getObjectsByOrgData(response, component);
        });
        $A.enqueueAction(action);
    },
    getObjectsByOrgData:function(response, component)
    { 
        var jsonData = response.getReturnValue();
        var objectArray =[];
        for(var j=0;j<jsonData.length;j++)
        {	
            var obje = jsonData[j];
            objectArray.push({"name" : obje["name"]});
		}
        component.set("v.objectData",objectArray);
 	},
     saveBackupConfig: function(component, helper,idSforg, flScdFrq, dayScheduled, objCriteria, idUser,dtScd, tmScd) {
        helper.saveBackupService(component, idSforg, flScdFrq, dayScheduled, objCriteria, idUser,dtScd, tmScd);
	},
    saveBackupService : function(component, idSforg, flScdFrq, dayScheduled, objCriteria, idUser,dtScd, tmScd){
        var action = component.get("c.saveBackupConfig");
        var objCriteriaStr = '{';
        for(var i=0;i<objCriteria.length;i++){
            if(objCriteria[i]!=undefined && objCriteria[i]!=null)
            {
                objCriteriaStr+='\"'+i+'\":'+JSON.stringify(objCriteria[i]);
                if(i<objCriteria.length-1)
                {
                    objCriteriaStr+=',';
                }
            }
        }
        objCriteriaStr+='}';
        var jso = JSON.parse(objCriteriaStr);
          action.setParams({ 
              "idSforg" : ''+idSforg,
              "flScdFrq" : flScdFrq,
              "dtScd":dtScd,
              "tmScd":tmScd,
              "dayScd" : dayScheduled,
              "objCriteria": objCriteriaStr,
              "idUser" :''+idUser
         });
        var ad={ 
              "idSforg" : ''+idSforg,
              "flScdFrq" : flScdFrq,
              "dtScd":dtScd,
              "tmScd":tmScd,
              "dayScd" : dayScheduled,
              "objCriteria": objCriteriaStr,
              "idUser" :''+idUser
         };
        console.log(ad);
        action.setCallback(this, function(response) {
            this.saveBackupResponce(response, component);
        });
      $A.enqueueAction(action);
    },
    saveBackupResponce:function(response, component)
    {
        debugger;
  		  var jsonData = response.getReturnValue();
          var objectArray=[];
      	  objectArray=jsonData;
        console.log(jsonData);
         var toastEvent = $A.get("e.force:showToast");
               toastEvent.setParams({
                 "title": "Status",
                 "message": jsonData
               });
               toastEvent.fire();
			   
        //  component.set("v.orgData",objectArray);
 	},
    getOrgsList : function(component, event, helper) {
        helper.getOrgsListService(component);
	},
    getOrgsListService : function(component){
        var action = component.get("c.getOrgsList");
          var idUser = 'f939bec89dc549d9bb2a5ef164ac0eb5'
          action.setParams({ 
            "idUser" : idUser
         });
        action.setCallback(this, function(response) {
            this.getOrgsListData(response, component);
        });
        $A.enqueueAction(action);
    },
    getOrgsListData:function(response, component)
    {
  		  var jsonData = response.getReturnValue();
          var objectArray=[];
      	  objectArray=jsonData;
          component.set("v.orgData",objectArray);
 	}
})