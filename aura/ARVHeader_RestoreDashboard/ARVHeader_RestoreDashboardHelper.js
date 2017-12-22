({
	setSfOrgId: function(component,event,helper){
       var sfOrgId =  component.get("v.sfOrgId");
       component.set("v.sfOrgId",sfOrgId);
       var cmpEvent = component.getEvent("orgIdChanged");
       cmpEvent.setParams({
           "sfOrgId": sfOrgId
        });
       cmpEvent.fire();  
	},
    sendEmailHelper: function(component, getEmail) { 
        // call the server side controller method 	
        var action = component.get("c.sendEmailNotification");
        var objects = JSON.stringify(component.get("v.restoreObjects"));
        var sfOrgId = component.get("v.sfOrgId");
        //alert('sfOrgId:'+sfOrgId+':objects:'+objects);
        var getEmail = component.get("v.email");
        // set the 3 params to sendMailMethod method   
        action.setParams({
            "sfOrgId": sfOrgId,
            "objects": objects, 
            "mMail": getEmail,
            "subject": "Restore Activity"
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                component.set("v.isOpen", false);
            }
 
        });
        $A.enqueueAction(action);
    },
    checkAttachment: function(component) {
        var sfOrgId = component.get("v.sfOrgId");
		var dataObjects = JSON.stringify(component.get("v.orgData"));
        var action = component.get("c.isEmailAttachment");
        action.setParams({
            "sfOrgId": sfOrgId,
            "objects": dataObjects,
            "subject": "Restore"
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var attachExists = response.getReturnValue();
                if(attachExists){
                    var toggleText = component.find("attachmentFile");
        			$A.util.toggleClass(toggleText, "toggle");
                }
                component.set("v.isAttachment", response.getReturnValue());
      			component.set("v.isOpen", true);
            }
        });
        $A.enqueueAction(action);
    },
    fireEvents:function(component, eventname){
       var cmpEvent = component.getEvent(eventname);
       cmpEvent.fire();  
    },
    exportToExcel:function(component, event, helper){
        var lstPositions = component.get("v.restoreObjects");
        var sfOrgID = component.get("v.sfOrgId");
        //alert(lstPositions+':'+sfOrgID);
        var data = [];
        var headerArray = [];
        var csvContentArray = [];
        headerArray.push('Activity ID');
        headerArray.push('Date');
        headerArray.push('Time');
 		headerArray.push('Duration');
        headerArray.push('Records');
        headerArray.push('Success');
        headerArray.push('API Calls');
        headerArray.push('Status');
        data.push(headerArray);
        
        for(var i=0;i<lstPositions.length;i++){
                //Initialize the temperory array
                var tempArray = [];
                tempArray.push('"'+lstPositions[i].idRestore+'"');
                tempArray.push('"'+lstPositions[i].tmStamp+'"');
                tempArray.push('"'+lstPositions[i].tmStamp+'"');
            	tempArray.push('"'+lstPositions[i].strTotDuration+'"');
            	tempArray.push('"'+lstPositions[i].nbrTotRecords+'"');
            	tempArray.push('"'+lstPositions[i].succesRecords+'"');
            	tempArray.push('"'+lstPositions[i].nbrTotApi+'"');
            	tempArray.push('"'+lstPositions[i].objProcStatus+'"');
                data.push(tempArray);
        }
        
        for(var j=0;j<data.length;j++){
            var dataString = data[j];//.join("\r\n");
            csvContentArray.push(dataString);            
        }
         var csvContent = csvContentArray.join("\r\n");
        var fileName = "Restore_" + sfOrgID + ".csv";
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
	}
})