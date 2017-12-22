({
    authAccordinClose: function(component, event, helper) {
        let authAccordin = component.find("authAccordin");
        $A.util.toggleClass(authAccordin, "slds-is-open");
         let authAcrnDiv = component.find("authAcrnDiv");
        $A.util.toggleClass(authAcrnDiv, "slds-hide");
    },
	toggleOrgs : function(component, helper) {
        helper.toggleHide(component,"takebackup");
        helper.toggleHide(component,"orglist");
        helper.addClass(component,"objectsList","slds-hide");
        helper.addClass(component,"schedule","slds-hide");
	},
     getbacktoOrgList : function(component, event, helper) {
        helper.changeHeaderBtn(component, event, helper);
		helper.toggleOrgs(component, helper);
        helper.getOrgsList(component, event, helper) ;
	},
    getCurentTime : function(component){
  		var dateFormat = "hh:mm";
		var dateString = $A.localizationService.formatDateTime(new Date(), dateFormat);
        component.set("v.currentTime",dateString);          
	},
    getObjectsByOrgId : function(component, event, helper) {
        var sfOrgID = event.getParam("sfOrgID");
     //   alert('sfOrgID:'+sfOrgID);
        component.set("v.idSforg",sfOrgID);
        helper.getObjectsByOrgService(component, sfOrgID, helper);
	},
    getObjectsByOrgService : function(component, sfOrgID, helper){
        debugger;
        var action = component.get("c.getSfObjects");
         action.setParams({ 
            "sfOrgID" : sfOrgID
         });
        action.setCallback(this, function(response) {
            debugger;
            this.getObjectsByOrgData(response, component, helper);
            helper.getOrgBackupCfg(component, sfOrgID, helper);
        });
        $A.enqueueAction(action);
    },
    getObjectsByOrgData:function(response, component, helper)
    { 
        var jsonData = response.getReturnValue();
        var objectArray =[];
        if(jsonData != null){
        	for(var j=0;j<jsonData.length;j++)
            {	
                var obje = jsonData[j];
                objectArray.push({
                    "name" : obje["name"],
                    "label": obje["label"]
                });
            }    
        }
        
        component.set("v.objectData",objectArray);
        component.set("v.loadingMsg","");
        helper.removeClass(component,"objectsList","slds-hide");
 	},
    getOrgBackupCfg:function(component, sfOrgID, helper){
        var action = component.get("c.getOrgBackupConfig");
         action.setParams({ 
            "sfOrgId" : sfOrgID
         });
        action.setCallback(this, function(response) {
            this.getOrgBackupCfgResponse(response, component,helper);
        });
        $A.enqueueAction(action);
    
	},
    getOrgBackupCfgResponse:function(response, component,helper){
        var jsonData = response.getReturnValue();
        if(jsonData!=null && jsonData!=undefined)
        {
            debugger;
           var objectArray =jsonData.objCriteria;            
           component.set("v.existedConfig",objectArray);
           component.set("v.flScdFeq",jsonData.flScdFrq);
            var dates=[],dateStr;
            if(jsonData.dtScd!=null && jsonData.dtScd!=undefined && jsonData.dtScd!="")
            {
                dateStr = jsonData.dtScd;
				dates=dateStr.split(",");
           	    component.set("v.dtScd",dates);
            }
            else
            {
                component.set("v.dtScd",dates);
            }
           component.set("v.dayScd",jsonData.dayScd);
            
           var tmScd =jsonData.tmScd;
           if(tmScd!=null && tmScd!=undefined && tmScd!= "")
           {
             var timesplit = tmScd.split(":");
             var h =timesplit[0];
             let ampm = (h >= 12 ? "PM" : "AM");
              h = h % 12;
              h = h ? h : 12; 
             var minutes = timesplit[1]; 
           	 component.set("v.hours",h);
             component.set("v.minutes",minutes);
             component.set("v.ampm",ampm);
           }
        }
        helper.removeClass(component,"schedule","slds-hide");
    },
     saveBackupConfig: function(component, event, helper,idSforg, flScdFrq, dayScheduled, objCriteria, idUser,dtScd, tmScd) {
        helper.saveBackupService(component, event, helper, idSforg, flScdFrq, dayScheduled, objCriteria, idUser,dtScd, tmScd);
	},
    saveBackupService : function(component, event, helper, idSforg, flScdFrq, dayScheduled, objCriteria, idUser,dtScd, tmScd){
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
        action.setCallback(this, function(response) {
            this.saveBackupResponce(response, component, event, helper);
        });
      $A.enqueueAction(action);
    },
    saveBackupResponce:function(response, component, event, helper)
    {
          helper.getbacktoOrgList(component, event, helper);
  		  var jsonData = response.getReturnValue();
          var orgName = "Org";
          var msg ="Backup configuration of "+orgName+" saved successfully";
          if(jsonData!="true")
          {
              msg = "Failed to save. Please reachout support@arvault.com";
              helper.toastMsg("Backup",msg, "error");
          }
        else
        {
             helper.toastMsg("Backup",msg, "success");
             component.set("v.isgetFetchObjects",false);
        }
 	},
    getOrgsList : function(component, event, helper) {
        helper.getOrgsListService(component);
	},
    getOrgsListService : function(component){
        var action = component.get("c.getOrgsList");
          var idUser =  component.get("v.idUser");
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
 	},
    changeHeaderBtn:function(component, event, helper){
            var Back = component.get("v.headerBtn");
            if(Back ==  "Back")
            {
               component.set("v.headerBtn","Register New Org");
            }
            else
            {
               component.set("v.headerSaveBtn","Save");
               component.set("v.headerBtn","Back");
            }
    },
    removeClass:function(component, id, classname){
         var removeClass=component.find(id);
         $A.util.removeClass(removeClass, classname);
	},
    addClass:function(component, id, classname){
         var addClass=component.find(id);
         $A.util.addClass(addClass, classname);
	},
    toggleHide:function(component, id){
        var toggleHide=component.find(id);
         $A.util.toggleClass(toggleHide, "slds-hide");
	},
    toastMsg:function(title, message, type){
         var toastEvent = $A.get("e.force:showToast");
               toastEvent.setParams({
                 "title": "Status",
                 "message": message,
                   "type":type
               });
               toastEvent.fire();
	},
    cleanPreviousState:function(component,event,helper)
    {
        
    },
     saveInfo : function(component, event, helper) {
         debugger;
		var hours = component.get("v.hours");
        var ampm =  component.get("v.ampm");
        var minutes =  component.get("v.minutes");
         let h =parseInt(hours);;
        if(ampm == "PM")
        {
          if(h<12)
          h = h+12;
          else
          h=0;
        }
            
         if(h<10)
         hours ="0"+h;
            else
            hours =""+h;    
         let m = parseInt(minutes);
         if(m<10)
         {
             minutes="0"+m
         }
         else
             minutes=""+m  
         let t =hours+":"+minutes;
         component.set("v.currentTime", t);
      /*  var getBObjects = component.get("c.getTimeStamp");
        getBObjects.setParams({ 
            "dateStr":"", 
            "timeStr":hours, 
            "minuteStr": minutes, 
            "ampm":ampm
        });            
        getBObjects.setCallback(this, function(a) {
            var bObjects = a.getReturnValue();
        	alert(bObjects); 
        });
                               
        $A.enqueueAction(getBObjects); */
	}
})