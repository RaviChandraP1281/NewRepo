({
    toggleChartData: function(component, event, helper, isInProgress) {      
        //helper.setInProgress(component);
        helper.orgIdChanged(component, event, helper) ;
	},
    toggleHide:function(component, id){
  		var div = component.find(id);
        $A.util.toggleClass(div, "slds-hide");
 	},
    getOrgsList : function(component, event, helper) {
        helper.getOrgsListService(component, helper);
	},
    getOrgsListService : function(component, helper){
        var action = component.get("c.getOrgsList");
        var idUser = component.get("v.idUser");
          action.setParams({ 
            "idUser" : idUser
         });
        action.setCallback(this, function(response) {
            this.getOrgsListData(response, component, helper);
        });
        $A.enqueueAction(action);
    },
    getOrgsListData:function(response, component, helper){
  		  var jsonData = response.getReturnValue();
          var objectArray=[];
          var userSelectedRestorePoints = [];
      	  objectArray=jsonData;
          if(objectArray.length>0)
          {
              component.set("v.sfOrgId",objectArray[0].idSforg);
              component.set("v.selectedOrgName",objectArray[0].nmLable);
              component.set("v.orgData",objectArray);
              helper.getRestoreObjects(component, helper, objectArray[0].idSforg);
           }
 	},
    getRestoreObjects : function(component, helper, sfOrgId){
        if(sfOrgId!=undefined && sfOrgId!=null)
        {
            var action = component.get("c.getListOfRestores");
            action.setParams({ "sfOrgId" : sfOrgId});
            action.setCallback(this, function(response){
                helper.getRestoreResponse(component, helper, response);         	                                 
            });
            $A.enqueueAction(action);
        }
    },
    getRestoreResponse:function(component, helper, response) {
        var responseList = response.getReturnValue();
        let restoreObjects =[];
        let completedObjects=[];
        let inprogressObjects = [];
		let liveStatus = [];
        for(let i=0,j=0,k=0; i<responseList.length;i++){
            if(responseList[i].objProcStatus=="COMPLETED"){
                completedObjects[j] = responseList[i];
                j++;
            }else{
                inprogressObjects[k]= responseList[i];
                if(inprogressObjects[k].liveStatus != null && inprogressObjects[k].liveStatus != ''){                    
                        let liveStatusText = 'Restore ID - '+ inprogressObjects[k].idRestore+' : '+inprogressObjects[k].liveStatus;
                        liveStatus.push(liveStatusText);
                }
                k++;
            }
			restoreObjects[i] = responseList[i];          
        }
        component.set("v.restoreObjects",restoreObjects);
        component.set("v.completedObjects",completedObjects);    
        component.set("v.inprogressObjects",inprogressObjects);  
            helper.divideHistoryData(component,helper); 
            let data =[];
             let isInprogress = component.get("v.isProgress");//component.find("historyToggle").get("v.checked");
            if(isInprogress){
            data=inprogressObjects;//.slice(0, 10);
                 }
            else{
                 data=completedObjects;//.slice(0, 10);
            }
            helper.updateChartData(component, helper,data);
           // arv.historyGraph(component, helper, "historyChartDiv", data, "restore");
    },
    backupChange:function(component, event, helper) {
        helper.divideHistoryData(component,helper);
        helper.updateChart(component, event, helper);
	},
    updateChart:function(component, event, helper){
        let data=component.get("v.topResultCriteria");
       helper.updateChartData(component, helper, data);
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
        debugger;
    },
    divideHistoryData:function(component,helper){
        let isInprogress = component.get("v.isProgress");//component.find("historyToggle").get("v.checked");
        if(isInprogress){
            let i=component.get("v.inprogressObjects");
            component.set("v.resultCriteria",i); 
            component.set("v.topResultCriteria",i.slice(0, 10)); 
        }
        else{
            let i=component.get("v.completedObjects");
            component.set("v.resultCriteria",i); 
            component.set("v.topResultCriteria",i.slice(0, 10)); 
        }
    },
    setInProgress:function(component) {
    	let isInProgressEnabled =component.find("historyToggle").get("v.checked");
        if(isInProgressEnabled){
            component.set("v.isProgress", true);
        }else{
            component.set("v.isProgress", false);
        }    
    },
    orgIdChanged:function(component, event, helper) {
        var isInProgressEnabled =component.get("v.isProgress");//component.find("historyToggle").get("v.checked");
        var sfOrgId =event.getParam("sfOrgId");
        if(sfOrgId==undefined || sfOrgId=="" || sfOrgId==null)
        {
            sfOrgId= component.get("v.sfOrgId");
        }
        component.set("v.sfOrgId", sfOrgId);  
        helper.getRestoreObjects(component, helper, sfOrgId);
    },
    getBackupActivities : function(component, helper){
        var sfOrgID = component.get("v.sfOrgId");
		 var orgData = component.get("v.orgData");
        var dateFilter = {};
        debugger;
        dateFilter.month = "9";
        dateFilter.year = "2017";
        dateFilter.fromdate = "8/8/2017";
        dateFilter.todate = "9/9/2017";
        console.log(dateFilter);
        component.set("v.dateFilter", dateFilter);
        var action = component.get("c.getBackupsForRestore");
        action.setParams({ 
            "sfOrgID" : sfOrgID,
            "sYear":  dateFilter.year,
            "sMonth":dateFilter.month,
            "sFromDate": dateFilter.fromdate,
            "sToDate":dateFilter.todate });
		action.setCallback(this, function(response){
          this.getBackActivitiesResponse(component, helper, response);
          helper.hideSpinner(component, helper);
        });
        $A.enqueueAction(action);
    },
    getBackActivitiesResponse: function(component, helper, response){
        let backup=response.getReturnValue();
            component.set("v.backupactivity",backup);
            component.set("v.topBackupactivity",backup.slice(0, 10));
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
	},
    showSpinner: function(component,  helper) {
        component.set("v.Spinner", true); 
   },
    hideSpinner : function(component,helper){   
       component.set("v.Spinner", false);
    },  
    historyGraph : function(component, helper, divId, data) {
        if(arv!=undefined && arv!=null)
        arv.historyGraph(component, helper,divId, data,"restore");
	},
    doLoadRestoreObject : function(component, event, helper) {
		//var sfOrgID = event.getParam("sfOrgId");
        var restoreID = event.getParam("restoreID");
	    var action = component.get("c.getRestoreObject");
          action.setParams({ 
            //"sfOrgID" : sfOrgID,
            "restoreID": restoreID
         });
        action.setCallback(this, function(response) {
            component.set("v.restoreObject",response.getReturnValue());
            var jsonData = response.getReturnValue();
            var objectArray = [];
            objectArray = jsonData.resultCriteria; 
            component.set("v.rc",objectArray);
            component.set("v.toprc",objectArray.slice(0, 10));
        });
        $A.enqueueAction(action);
    },
    toggleHide:function(component, id){
  		var div = component.find(id);
        $A.util.toggleClass(div, "slds-hide");
 	},
    NaNShouldZero:function(val){
        return (isNaN(val)?0:val);
    },
    updateChart:function(component, event, helper){
        let data=component.get("v.topResultCriteria");
        arv.historyGraph(component, helper, "historyChartDiv", data, "backup");
	},
    everyMinute :function(component, event, helper, orgId){
         var that = this;
         helper.getRestoreObjects(component, helper, orgId);
            window.setTimeout(
                $A.getCallback(function() {
                    that.everyMinute(component, event, helper, orgId);
        }), 30000); 
    }
})