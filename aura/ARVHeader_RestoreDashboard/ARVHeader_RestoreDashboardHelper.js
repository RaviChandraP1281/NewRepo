({
	getOrgsList : function(component, event, helper) {
        helper.getOrgsListService(component);
	},
    getOrgsListService : function(component){
        var action = component.get("c.getOrgsList");
        var idUser = component.get("v.idUser");
          action.setParams({ 
            "idUser" : idUser
         });
        action.setCallback(this, function(response) {
            this.getOrgsListData(response, component);
        });
        $A.enqueueAction(action);
    },
    getOrgsListData:function(response, component){
  		  var jsonData = response.getReturnValue();
          var objectArray=[];
          var userSelectedRestorePoints = [];
      	  objectArray=jsonData;
          if(objectArray.length>0)
          {
              component.set("v.sfOrgId",objectArray[0].idSforg);
              component.set("v.orgData",objectArray);
           }
 	},
    sendEmailHelper: function(component, getEmail) { 
        // call the server side controller method 	
        var action = component.get("c.sendEmailNotification");
        var objects = JSON.stringify(component.get("v.restoreObjects"));
        var sfOrgId = '00D6F000001OOISUA4';//component.get("v.sfOrgId");
        alert('sfOrgId:'+sfOrgId+':objects:'+objects);
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
                tempArray.push('"'+lstPositions[i].restoreActivityId+'"');
                tempArray.push('"'+lstPositions[i].restoreUser+'"');
                tempArray.push('"'+lstPositions[i].restoreDateTime+'"');
            	tempArray.push('"'+lstPositions[i].Duration+'"');
            	tempArray.push('"'+lstPositions[i].Records+'"');
            	tempArray.push('"'+lstPositions[i].Size+'"');
            	tempArray.push('"'+lstPositions[i].APICalls+'"');
            	tempArray.push('"'+lstPositions[i].Status+'"');
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