({
    toggleChartData: function(component, event, helper, isForceBackup) { 
        helper.setInProgress(component);
        if(!isForceBackup){
        	helper.orgIdChanged(component, event, helper) ;
        }
	},
    setInProgress:function(component) {
    	let isInProgressEnabled =component.get("v.isInprogressBackup");								
        component.set("v.isProgress", isInProgressEnabled);
    },
    orgIdChanged:function(component, event, helper) {
        var isForceBackup =event.getParam("isForceBackup");
        var isInProgressEnabled =component.get("v.isInprogressBackup");
        if(isForceBackup && !isInProgressEnabled)
        {         
      	   component.set("v.chartType","column");
           component.set("v.isInprogressBackup", true);
           helper.toggleChartData(component, event, helper, isForceBackup);
        }
        
        var sfOrgId =event.getParam("sfOrgId");
        if(sfOrgId==undefined || sfOrgId=="" || sfOrgId==null)
        {
            sfOrgId= component.get("v.sfOrgId");
        }
        component.set("v.sfOrgId", sfOrgId);  
        helper.getBackupActivity(component, helper, sfOrgId);
    },
    toggleHide:function(component, id){
  		var div = component.find(id);
        $A.util.toggleClass(div, "slds-hide");
 	},
    getBackupActivity : function(component, helper, sfOrgID){
        let lastrun = component.get("v.lastrun");
        if(sfOrgID!=undefined && sfOrgID!=null)
        {
            var action = component.get("c.getListOfBackups");
            action.setParams({ "sfOrgID" : sfOrgID});
            action.setCallback(this, function(response) {
                try
                {
                this.getBackupResponse(component,helper, response);
                }catch(e){
                    console.log(e);
                }
            });
            $A.enqueueAction(action);
          component.set("v.lastrun", (new Date()).getTime());
        }
    },
    backupChange:function(component, event, helper) {
        helper.divideHistoryData(component,helper);
        helper.updateChart(component, event, helper);
	},
    updateChart:function(component, event, helper){
        let data=component.get("v.topResultCriteria");
         helper.updateChartData(component,helper, data);
	},
    getBackupResponse: function(component, helper, response) {
        var responseList = response.getReturnValue();
        let historyData = [];
        let inprogressData = [];
        let backupObjects =[];
        let inprogressObjects = [];
        let liveStatus = [];
        var PAGE_MAX_SIZE=component.get("v.PAGE_MAX_SIZE");
        for(let i=0,j=0,k=0; i<responseList.length;i++){
            if(responseList[i].objProcStatus=="COMPLETED"){
                backupObjects[j] = responseList[i];
               j++;
            }
            else {
                inprogressObjects[k]= responseList[i];
                if(inprogressObjects[k].liveStatus != null && inprogressObjects[k].liveStatus != ''){                    
                        let liveStatusText = 'Backup ID - '+ inprogressObjects[k].backupId+' : '+inprogressObjects[k].liveStatus;
                        liveStatus.push(liveStatusText);
                }    
                k++;
            }
        }
        try{
            responseList.sort(arv.GetSortOrder("tmStamp",false));
            backupObjects.sort(arv.GetSortOrder("tmStamp",false));
            inprogressObjects.sort(arv.GetSortOrder("tmStamp",false));
        }catch(e){
            console.log(e);
        }
        	component.set("v.backupObjects",responseList);    
            component.set("v.completedObjects",backupObjects);    
            component.set("v.inprogressObjects",inprogressObjects); 
            component.set("v.page","1"); 
         var totalpages=1;
        try{
        var totalpages=parseInt(backupObjects.length/PAGE_MAX_SIZE)+1;
        }
        catch(e){
            console.log(e);
        }
            component.set("v.totalpages",totalpages); 
            helper.divideHistoryData(component,helper); 
        let data =[];
         let isInprogress = component.get("v.isInprogressBackup");
        if(isInprogress){
            data=inprogressObjects.slice(0, PAGE_MAX_SIZE);
             }
        else{
             data=backupObjects.slice(0, PAGE_MAX_SIZE);
        }
        helper.updateChartData(component,helper, data);
        component.set("v.Spinner",false);
    },
    updateChartData:function(component,helper,data){
        let dataset=[];
        let datesset=[];
        var masterChild =new Array();
        let Months = ['Jan','Feb','Mar','April','May','June','July','Aug','Sept','Oct','Nov','Dec'];
        for(let l=0;l<data.length;l++){
          let successCount = data[l].successCount;
          let timestamp = data[l].tmStamp;
            masterChild.push({0:data[l].tmStamp, 1:data[l].successCount});
          debugger;
            if(successCount!==undefined && successCount!=undefined && successCount!=null && successCount!='undefined')
          {
            dataset.push(successCount);
          }
          else{
           dataset.push(0);
          }
          if(timestamp!=undefined && timestamp!=null)
          {
              let datese=new Date(timestamp);
         	  datesset.push(''+datese.getDate()+'-'+Months[datese.getMonth()]+'-'+datese.getFullYear());//+'('+data[l].backupId+')');
          }
          else
          {
               datesset.push('No date');
          }
        }
          component.set("v.chartDates",datesset);
          component.set("v.chartData",dataset);
    },
    divideHistoryData:function(component,helper){
        let isInprogress =  component.get("v.isInprogressBackup");
         var PAGE_MAX_SIZE=component.get("v.PAGE_MAX_SIZE");
        var i=[];
        if(isInprogress){
             i=component.get("v.inprogressObjects");
        }
        else{
             i=component.get("v.completedObjects");
        }
         component.set("v.page","1"); 
         component.set("v.totalpages",""+(parseInt(i.length/PAGE_MAX_SIZE)+1)); 
         component.set("v.resultCriteria",i); 
         component.set("v.topResultCriteria",i.slice(0, PAGE_MAX_SIZE)); 
    },
    doLoadActivityObject : function(component, event, helper) {
		var sfOrgID = event.getParam("sfOrgId");
        var backupID = event.getParam("backupActivityID");
	    var action = component.get("c.getBackupObject");
          action.setParams({ 
            "sfOrgID" : sfOrgID,
            "backupID": backupID
         });
        action.setCallback(this, function(response) {
            component.set("v.backupObject",response.getReturnValue());
            var PAGE_MAX_SIZE=component.get("v.PAGE_MAX_SIZE");
            var jsonData = response.getReturnValue();
            var objectArray = [];
            objectArray = jsonData.resultCriteria; 
            try
            {
            	objectArray.sort(arv.GetSortOrder("objname",true));
            }catch(e){
                console.log(e);
            }
            
            component.set("v.rc",objectArray);
            component.set("v.toprc",objectArray);
            helper.NavigateComponent(component, event, helper);
        });
        $A.enqueueAction(action);
        
    },
     NavigateComponent : function(component,event,helper) {
     /* $A.createComponent(
         "c:ARV_Backup_ActivityObject",
         {
           "selectedOrgName" : component.get("v.selectedOrgName"),
             "backupObject" : component.get("v.backupObject"),
             "topResultCriteria" : component.get("v.toprc"),
             "resultCriteria" : component.get("v.rc"),
             "page":"1"
            
         },
         function(newCmp){
            if (component.isValid()) {
                component.find("activitiesList").set("v.body", newCmp);
            }
         }
      );*/
         var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
        componentDef : "c:ARV_Backup_ActivityObject",
        componentAttributes: {
          "selectedOrgName" : component.get("v.selectedOrgName"),
             "backupObject" : component.get("v.backupObject"),
             "topResultCriteria" : component.get("v.toprc"),
             "resultCriteria" : component.get("v.rc"),
             "page":"1"
        }
        });
        evt.fire();
   },
    NaNShouldZero:function(val){
        return (isNaN(val)?0:val);
    },
    everyMinute :function(component, event, helper, orgId){
         var that = this;
         helper.getBackupActivity(component, helper, orgId);
            window.setTimeout(
                $A.getCallback(function() {
                    that.everyMinute(component, event, helper, orgId);
        }), 30000); 
    }
})