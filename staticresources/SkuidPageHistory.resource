function manageHistory(sessionId,userId,currentPageName,ProfileName)
{
	try{
            var dateObj = new Date();
			var month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
			var date = ('0' + dateObj.getDate()).slice(-2);
			var year = dateObj.getFullYear();
			var shortDate = year + '-' + month + '-' + date;
            // Getting Session ID.
            sforce.connection.sessionId = sessionId;
        
            //Get SkuidPageHistory id
            var skuidPageHistoryID= sforce.connection.query("SELECT Id,VisitCount__c from SkuidPageHistory__c where UserId__c = '" + userId +"' and LastVisitedDate__c = "+ shortDate +" and PageName__c = '"+ currentPageName +"'  and ProfileName__c = '"+ ProfileName +"'  limit 1");
          
            records = skuidPageHistoryID.getArray("records"); 
            console.log(  skuidPageHistoryID);  
			if (sforce.console.isInConsole() || !sforce.console.isInConsole()) 
			{
			
				if(skuidPageHistoryID.size==0)
				{      
					   var skuidPage = new sforce.SObject("SkuidPageHistory__c");
						skuidPage.PageName__c = currentPageName;
						skuidPage.UserId__c = userId;
						skuidPage.ProfileName__c = ProfileName;
						skuidPage.VisitCount__c = 1; 
						skuidPage.LastVisitedDate__c = shortDate;
						var result = sforce.connection.create([skuidPage]);
						 
						if (result[0].getBoolean("success")) {
						console.log("skuidPageHistory is created with id " + result[0].id);
						}                 
						else {
						console.log("failed to create skuidPageHistory" + result[0]);
						} 
				 }
				 else
				 {
					// var skuidPGId = records[0].Id;
					 var visitCount = records[0].VisitCount__c ;
					 var updtSkuidPageHistory = records[0];
					 updtSkuidPageHistory.VisitCount__c = parseInt(visitCount)+1;
					 updtSkuidPageHistory.LastVisitedDate__c = shortDate;
					 var res = sforce.connection.update([updtSkuidPageHistory]);
					 
						if (res[0].getBoolean("success")) {
						console.log("skuidPageHistory is Updated with id " + res[0].id);
						}                 
						else {
						console.log("failed to Update skuidPageHistory" + res[0]);
						}  
				 }
			}
		}
		catch(err)
		{
		   console.log(err.message);
		}
}