({
    setSfOrgId :  function(component, event, helper){ 
         var a =false;
         component.set("v.sfOrgId", event.getSource().get("v.value"));
         helper.setSfOrgId(component, event, helper, a);
    },
    refreshPage: function(component, event, helper){
    var cmpEvent = component.getEvent("refresh");
        	cmpEvent.fire();  
	},
   orgChangeEvent:  function(component, event, helper){
        var a =false;
        component.set("v.sfOrgId", event.getParam("sfOrgId"));
        helper.setSfOrgId(component, event, helper, a);
   },
	showModal :  function(component, event, helper){
	    component.set("v.isForceBackup", true);
	},
    closeModal :  function(component, event, helper){
	    component.set("v.isForceBackup", false);
	},
    saveit:function(component, event, helper){
        helper.startBackup(component, event, helper);
        component.set("v.isForceBackup", false);
        component.find("bkpLabel").set("v.value","");
    },
    hidePopup:function(component,event,helper){
    	helper.hidePopupHelper(component, 'modaldialog', 'slds-fade-in-');
		helper.hidePopupHelper(component, 'backdrop', 'slds-backdrop--');
    	component.find("bkpLabel").set("v.value","");
	},
    saveitaa:function(component,event,helper){
        helper.startBackup(component,event,helper);
    	helper.hidePopupHelper(component, 'modaldialog', 'slds-fade-in-');
		helper.hidePopupHelper(component, 'backdrop', 'slds-backdrop--');
    	component.find("bkpLabel").set("v.value","");
	},
   fireLiveBackupEvent : function(component, event, helper){        
       var graphbtn = component.find("togglelist");
       $A.util.toggleClass(graphbtn,"slds-is-selected");
       var isInprogress=false;
       if($A.util.hasClass(graphbtn,"slds-is-selected"))
       {
           isInprogress=true;
       }
       var cmpEvent = component.getEvent("liveBackupEvent");
       cmpEvent.setParams({ "isInprogress" : isInprogress});
       cmpEvent.fire();    
    },
    fireShowGraph : function(component, event, helper){        
            var graphbtn = component.find("graphBtn");
         	$A.util.toggleClass(graphbtn,"slds-is-selected");
        	var cmpEvent = component.getEvent("displaygraph");
        	cmpEvent.fire();    
    },
    fireShowFilter : function(component, event, helper){
          var filterbtn = component.find("filterBtn");
           $A.util.toggleClass(filterbtn,"slds-is-selected");
        	var cmpEvent = component.getEvent("displayfilter");
        	cmpEvent.fire();    
    },
    exportToExcel : function(component, event, helper) {
        var lstPositions = component.get("v.backupObjects");
        //var sfOrgID = component.find("orgIDs").get("v.value");
        var sfOrgID = component.get("v.sfOrgId");
        //alert(lstPositions);
        //alert('sfOrgID:'+sfOrgID);
        var data = [];
        var headerArray = [];
        var csvContentArray = [];
        headerArray.push('Activity ID');
        headerArray.push('User');
        headerArray.push('Date/Time');
 		headerArray.push('Duration');
        headerArray.push('Records');
        headerArray.push('Size');
        headerArray.push('API Calls');
        headerArray.push('Status');
        data.push(headerArray);
        
        for(var i=0;i<lstPositions.length;i++){
                //Initialize the temperory array
                var tempArray = [];
                tempArray.push('"'+lstPositions[i].backupId+'"');
                tempArray.push('"'+lstPositions[i].idUser+'"');
                tempArray.push('"'+lstPositions[i].tmStamp+'"');
            	tempArray.push('"'+lstPositions[i].strTotDuration+'"');
            	tempArray.push('"'+lstPositions[i].nbrTotRecords+'"');
            	tempArray.push('"'+lstPositions[i].Size+'"');
            	tempArray.push('"'+lstPositions[i].nbrTotApi+'"');
            	tempArray.push('"'+lstPositions[i].objProcStatus+'"');
                data.push(tempArray);
        }
        
        for(var j=0;j<data.length;j++){
            var dataString = data[j];//.join("\r\n");
            csvContentArray.push(dataString);            
        }
         var csvContent = csvContentArray.join("\r\n");
        var fileName = "Backup_" + sfOrgID + ".csv";
        var uri = 'data:text/csv;charset=utf-8,' + encodeURIComponent(csvContent);
        if (navigator.msSaveBlob) { // IE 10+
            console.log('----------------if-----------');
            var blob = new Blob([csvContent],{type: "text/csv;charset=utf-8;"});
            console.log('----------------if-----------'+blob);
        	navigator.msSaveBlob(blob, fileName);
        }
        else{
            // Download file
            // you can use either>> window.open(uri);
            // but this will not work in some browsers
            // or you will not get the correct file extension    
            var link = document.createElement("a");

            link.setAttribute('download',fileName);
            link.href = uri;
            link.style = "visibility:hidden";
            
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
    },
    openModel: function(component, event, helper) {
        helper.checkAttachment(component);    
   },
    closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.isOpen", false);
      component.set("v.isAttachment", false);
      component.set("v.email", null);
   },
    sendEmail : function(component, event, helper) {
    	var getEmail = component.get("v.email");
        if ($A.util.isEmpty(getEmail) || !getEmail.includes("@")) {
            alert('Please Enter valid Email Address');
        } else {
            helper.sendEmailHelper(component, getEmail);            
        }
    }    
})