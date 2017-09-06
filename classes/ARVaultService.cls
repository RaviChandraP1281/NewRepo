public class ARVaultService {

   public static String baseURL = 'http://54.202.231.145:8080/ARVault';
  
    @AuraEnabled
    public static String saveBackupConfig(String idSforg, String flScdFrq, String dtScd, String tmScd, String dayScd, String objCriteria, String idUser){
       System.debug(objCriteria);
        String jsonInput = '{"idSforg": "'+idSforg
            +'","flScdFrq": "'+flScdFrq
            +'","dtScd": "'+dtScd
            +'","tmScd": "'+tmScd
            +'","dayScd": "'+dayScd
            +'","objCriteria": '+  objCriteria
            +',"idUser": "'+idUser+'"}';
        String jsont =jsonInput;
        String serviceURL = baseURL + '/addSforgBakupCfg';
        System.debug(jsont);
        String responseList = generateResponseStr(serviceURL, jsont);
        return responseList;    
    }
    public static String generateResponseStr(String serviceURL, String jsonInput){
       HttpRequest req = new HttpRequest();
        req.setEndpoint(serviceURL);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');
		//req.setBodyAsBlob()
     
        String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
        String password = 'Naresh@7';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setBody(jsonInput);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        String responseObjects = '';
        if(res.getStatusCode() == 200)
        { 
            system.debug('Authentication success!!!' + res);
            System.debug(res.getBody());
            responseObjects =(String)res.getBody();                      
        } 
        else
        {
            system.debug('Authentication failed!!!' + res + res.getStatusCode());
  			responseObjects = (String)res.getBody();                               	
        }
        return responseObjects;
    }    
     @AuraEnabled
    public static List<Object> getOrgsList(String userid){
        String jsonInput = '{"idUser": "f939bec89dc549d9bb2a5ef164ac0eb5"}';
        String serviceURL = baseURL + '/getAllSforgEnviInfoOfUser';
        List<Object> responseList = generateListResponse(serviceURL, jsonInput);
        System.debug(responseList);
        return responseList;    
    }
    @AuraEnabled
    public static Map<String, Object> getOrgsDetails(String sfOrgId){
  
        String jsonInput = '{"sfOrgId":"'+sfOrgId+'"}';//'{"sfOrgId":"00D6F000001OOISUA4"}';
        String serviceURL = baseURL + '/getSforgEnvi';
        Map<String, Object> responseList = generateResponse(serviceURL, jsonInput);
        System.debug(responseList);
        return responseList;    
    }
    public static List< Object> generateListResponse(String serviceURL, String jsonInput){
    	       
        HttpRequest req = new HttpRequest();
        req.setEndpoint(serviceURL);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');
        
        // Specify the required user name and password to access the endpoint
        // As well as the header and header information
        
        String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
        String password = 'Naresh@7';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setBody(jsonInput);
        
        // Create a new http object to send the request object
        // A response object is generated as a result of the request  
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        List<Object> responseObjects = new List<Object>();
        if(res.getStatusCode() == 200)
        { 
            system.debug('Authentication success!!!' + res);
            System.debug(res.getBody());
            responseObjects = (List<Object>) JSON.deserializeUntyped(res.getBody());                         
        } 
        else
        {
            system.debug('Authentication failed!!!' + res + res.getStatusCode());
  			responseObjects = (List<Object>) JSON.deserializeUntyped(res.getBody());                               	
        }
        return responseObjects;
    }
    @AuraEnabled
   public static String basicAuthCallout(String orgName, String userName, String pwd){
       System.debug(''+orgName+', '+userName+', '+pwd);
     String userInfo = '{"nmLable":"'+orgName+'", "sfNmUser":"'+userName+'","sfTxPwd":"'+pwd+'"}';
	 String serviceURL = baseURL + '/addSforgEnvi';
    
     Map<String, Object> responseList = generateResponse(serviceURL, userInfo);
     String responseStr = (String) responseList.get('idSforg');  
       System.debug(''+responseStr);
     return responseStr;  
   }

    @AuraEnabled
    public static List<Object> getSfObjects(String sfOrgID){
        String jsonInput = '{"sfOrgId": "'+sfOrgID+'"}';
        String serviceURL = baseURL + '/getSfObjects';
        Map<String, Object> responseList = generateResponse(serviceURL, jsonInput);
        List<Object> objList = (List<Object>) responseList.get('objects');
        return objList;    
    }
    
    @AuraEnabled
    public static List<Object> getSfFields(String sfOrgID, String sfObjName){
         String jsonInput = '{"sfOrgId": "'+sfOrgID+'", "sfObjName": "'+sfObjName+'"}';
         String serviceURL = baseURL + '/getSfFields';
         Map<String, Object> responseList = generateResponse(serviceURL, jsonInput);
         List<Object> objList = (List<Object>) responseList.get('fields');
     	 return objList;
    }
    
        
    public static Map<String, Object> generateResponse(String serviceURL, String jsonInput){
    	       
        HttpRequest req = new HttpRequest();
        req.setEndpoint(serviceURL);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');
        
        // Specify the required user name and password to access the endpoint
        // As well as the header and header information
        
        String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
        String password = 'Naresh@7';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setBody(jsonInput);
        
        // Create a new http object to send the request object
        // A response object is generated as a result of the request  
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        Map<String, Object> responseObjects = new Map<String, Object>();
        if(res.getStatusCode() == 200)
        { 
            system.debug('Authentication success!!!' + res);
            System.debug(res.getBody());
            responseObjects = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());                         
        } 
        else
        {
            system.debug('Authentication failed!!!' + res + res.getStatusCode());
  			responseObjects = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());                               	
        }
        return responseObjects;
    }
      
      @AuraEnabled
      public static void startBackup (String sfOrgID) {
      	String jsonInput = '{"sfOrgId": "'+sfOrgID+'"}';
        String serviceURL = baseURL + '/startBackup';
        Map<String, Object> responseList = generateResponse(serviceURL, jsonInput);
        System.debug('responseList:'+responseList);
      }
    
      @AuraEnabled
      public static String getBackupHistory (Integer top) {
         String res = '{"activityhistory":[{"id":"1001","date":"23-June-2017","records":"200","objectscount":"2","triggeredby":"leelapavan.a@autorabit.com"},{"id":"1025","date":"26-June-2017","records":"200","objectscount":"2","triggeredby":"leelapavan.a@autorabit.com"},{"id":"1002","date":"23-June-2017","records":"200","objectscount":"2","triggeredby":"leelapavan.a@autorabit.com"},{"id":"1003","date":"23-June-2017","records":"200","objectscount":"2","triggeredby":"leelapavan.a@autorabit.com"},{"id":"1004","date":"23-June-2017","records":"200","objectscount":"2","triggeredby":"leelapavan.a@autorabit.com"},{"id":"1005","date":"23-June-2017","records":"200","objectscount":"2","triggeredby":"leelapavan.a@autorabit.com"},{"id":"1006","date":"23-June-2017","records":"200","objectscount":"2","triggeredby":"leelapavan.a@autorabit.com"},{"id":"1007","date":"23-June-2017","records":"200","objectscount":"2","triggeredby":"leelapavan.a@autorabit.com"},{"id":"1008","date":"23-June-2017","records":"200","objectscount":"2","triggeredby":"leelapavan.a@autorabit.com"},{"id":"1009","date":"23-June-2017","records":"200","objectscount":"2","triggeredby":"leelapavan.a@autorabit.com"}]}';
            return res;
      }
    
      @AuraEnabled
      public static List<Object> getListOfBackups (String sfOrgID) {
          String jsonInput = '{"sfOrgId": "'+sfOrgID+'"}';
          String serviceURL = baseURL + '/getAllSforgBakupStatus';
          List<Object> responseList = generateListResponse(serviceURL, jsonInput);
          System.debug('responseList:'+responseList);
          return responseList;
      }
    
      @AuraEnabled
      public static Map<String, Object> getBackupObject (String sfOrgID, String backupID) {
          String jsonInput = '{"sfOrgId": "'+sfOrgID+'", "backupId" : "'+backupID+'"}';
          String serviceURL = baseURL + '/getSforgBakupStatus';
          Map<String, Object> responseList = generateResponse(serviceURL, jsonInput);
          
          System.debug(responseList);
          return responseList;
      }
    
    
    
      @AuraEnabled
      public static List<Object> getRecordsPerFilter (String sfOrgID, String backupID, String objName, String fieldName, String customField) {
          String resp = '{ "records": [ { "backactivityId": "1001", "recordId": "1001", "backupTime":  "21:00:00", "recordField" : "Billing City", "backupUser" : "User1", "phone" : "9999999999" }, { "backactivityId": "1001", "recordId": "1002", "backupTime":  "21:00:00", "recordField" : "Billing City", "backupUser" : "User1", "phone" : "9999999999" }, { "backactivityId": "1001", "recordId": "1003", "backupTime":  "21:00:00", "recordField" : "Billing City", "backupUser" : "User1", "phone" : "9999999999" }, { "backactivityId": "1001", "recordId": "1004", "backupTime":  "21:00:00", "recordField" : "Billing City", "backupUser" : "User1", "phone" : "9999999999" } ] }';
          Map<String, Object> objMap = (Map<String, Object>) JSON.deserializeUntyped(resp);
          System.debug(objMap);
          List<Object> objList = (List<Object>) objMap.get('records');
          System.debug('getRecordsPerFilter:'+objList);
          return objList;
      }
    
	  @AuraEnabled
      public static List<Object> getRestores (String sfOrgID) {
          String resp = '{ "restoreObjs": [ { "restoreActivityId": "1001", "Duration": "23 mins","Records": "1000", "Size" : "234" , "APICalls": "45", "restoreDateTime":  "08/09/2017 21:00:00","Status" : "In Progress","restoreUser" : "User1" },'+ 
          '{ "restoreActivityId": "1001", "Duration": "23 mins","Records": "1000", "Size" : "234" , "APICalls": "45", "restoreDateTime":  "08/09/2017 21:00:00","Status" : "In Progress","restoreUser" : "User1" }, { "restoreActivityId": "1001", "Duration": "23 mins","Records": "1000", "Size" : "234" , "APICalls": "45", "restoreDateTime":  "08/09/2017 21:00:00","Status" : "In Progress","restoreUser" : "User1" }, { "restoreActivityId": "1001", "Duration": "23 mins","Records": "1000", "Size" : "234" , "APICalls": "45", "restoreDateTime":  "08/09/2017 21:00:00","Status" : "In Progress","restoreUser" : "User1" }] }';
          Map<String, Object> objMap = (Map<String, Object>) JSON.deserializeUntyped(resp);
          System.debug(objMap);
          List<Object> objList = (List<Object>) objMap.get('restoreObjs');
          System.debug(objList);
          return objList;
      }
    
      @AuraEnabled
      public static List<Object> getFObjectsPerBackup (String sfOrgID, String backupID) {
          // after webservice integration we will use the reponse string
          String resp = '';
          if(backupID == '1001'){
              resp = '{ "objects": [{"name": "Lead", "fields": [{"fieldName":"Name1"},{"fieldName":"Id1"},{"fieldName":"Type1"},{"fieldName":"LastModifiedDate1"},{"fieldName":"LastModifiedById1"}]}, { '+
                  '"name": "Account", "fields": [{"fieldName":"Name2"},{"fieldName":"Id2"},{"fieldName":"Type2"},{"fieldName":"LastModifiedDate2"},{"fieldName":"LastModifiedById2"}]}, { '+
                  '"name": "Contact", "fields": [{"fieldName":"Name3"},{"fieldName":"Id3"},{"fieldName":"Type3"},{"fieldName":"LastModifiedDate3"},{"fieldName":"LastModifiedById3"}]}, { '+
                  '"name": "Opportunity","fields": [{"fieldName":"Name4"},{"fieldName":"Id4"},{"fieldName":"Type4"},{"fieldName":"LastModifiedDate4"},{"fieldName":"LastModifiedById4"}]}]	 }';    
          }else{
              resp = '{ "objects": [{"name": "Lead", "fields": [{"fieldName":"Name1"},{"fieldName":"Id1"},{"fieldName":"Type1"},{"fieldName":"LastModifiedDate1"},{"fieldName":"LastModifiedById1"}]}, {'+
                  '"name": "Opportunity", "fields": [{"fieldName":"Name1"},{"fieldName":"Id2"},{"fieldName":"Type2"},{"fieldName":"LastModifiedDate2"},{"fieldName":"LastModifiedById2"}] }]	 }';
          }
          
          Map<String, Object> objMap = (Map<String, Object>) JSON.deserializeUntyped(resp);
          System.debug(objMap);
          List<Object> objList = (List<Object>) objMap.get('objects');
          System.debug(objList);
          return objList;
      }
    
    @AuraEnabled
      public static List<Object> getDataFromSnapshotID (String sfOrgID, String snapshotID) {
          String resp = '{ "dataFromSnapshot": [ { "recordId": "0010","Name":  "GenePoint","billingCity" : "New York","billingState" : "CA","phoneNo" : "9999999990"}, { "recordId": "0011","Name":  "GenePoint","billingCity" : "New York","billingState" : "CA","phoneNo" : "9999999990"},{ "recordId": "0013","Name":  "GenePoint","billingCity" : "New York","billingState" : "CA","phoneNo" : "9999999990"} ] }';
          Map<String, Object> objMap = (Map<String, Object>) JSON.deserializeUntyped(resp);
          System.debug(objMap);
          List<Object> objList = (List<Object>) objMap.get('dataFromSnapshot');
          System.debug(objList);
          return objList;
      }
    @AuraEnabled
     public static List<Object> getListOfSnapshots (String sfOrgID) {
          String resp = '{ "snapshotList": [ { "backupId": "1001","user":  "USER_1","date": "08/09/2017","time" : "10.45 am", "duration" : "23 mins", "records" : "22", "size": "234","apiCalls":  "1000","status": "true"}, { "backupId": "1002","user":  "USER_1","date": "08/09/2017","time" : "10.45 am", "duration" : "23 mins", "records" : "22", "size": "234","apiCalls":  "1000","status": "true"}, { "backupId": "1003","user":  "USER_1","date": "08/09/2017", "time" : "10.45 am", "duration" : "23 mins", "records" : "22", "size": "234","apiCalls":  "1000","status": "true"}, { "backupId": "1004","user":  "USER_1","date": "08/09/2017","time" : "10.45 am", "duration" : "23 mins", "records" : "22", "size": "234","apiCalls":  "1000","status": "true"}, { "backupId": "1005","user":  "USER_1","date": "08/09/2017","time" : "10.45 am", "duration" : "23 mins", "records" : "22", "size": "234","apiCalls":  "1000","status": "true"} ] }';
          Map<String, Object> objMap = (Map<String, Object>) JSON.deserializeUntyped(resp);
          System.debug(objMap);
          List<Object> objList = (List<Object>) objMap.get('snapshotList');
          System.debug(objList);
          return objList;
      }
    
      @AuraEnabled
      public static List<Object> getBackupsPerFilter (String sfOrgID, String backupYear, String backupMonth, String fromDate, String toDate) {
          String resp = '{ "backups": [ { "backactivityId": "1001","backupTime":  "21:00:00","backupType" : "Scheduled","backupUser" : "User1" }, { "backactivityId": "1002","backupTime":  "21:00:00","backupType" : "Scheduled","backupUser" : "User1" }, { "backactivityId": "1003","backupTime":  "21:00:00","backupType" : "Scheduled","backupUser" : "User1" }, { "backactivityId": "1004","backupTime":  "21:00:00","backupType" : "Scheduled","backupUser" : "User1" } ] }';
          Map<String, Object> objMap = (Map<String, Object>) JSON.deserializeUntyped(resp);
          System.debug(objMap);
          List<Object> objList = (List<Object>) objMap.get('backups');
          System.debug('getBackupsPerFilter:'+objList);
          return objList;
      }
	
	  @AuraEnabled
      public static String submitRestoreRequest (String sfOrgID, String backupIDs, String recordIDs) {
          /*String resp = '{ "backups": [ { "backactivityId": "1001","backupTime":  "21:00:00","backupType" : "Scheduled","backupUser" : "User1" }, { "backactivityId": "1002","backupTime":  "21:00:00","backupType" : "Scheduled","backupUser" : "User1" }, { "backactivityId": "1003","backupTime":  "21:00:00","backupType" : "Scheduled","backupUser" : "User1" }, { "backactivityId": "1004","backupTime":  "21:00:00","backupType" : "Scheduled","backupUser" : "User1" } ] }';
          Map<String, Object> objMap = (Map<String, Object>) JSON.deserializeUntyped(resp);
          System.debug(objMap);
          List<Object> objList = (List<Object>) objMap.get('backups');
          System.debug('getBackupsPerFilter:'+objList);
          return objList; */
          System.debug('submitRestoreRequest');
          return 'True';
      }
    
    public static  String getObject(String objName, Map<String, Object> rMap){
        String excelString = '';
        System.debug('objName:'+objName);
        if('Restore'.equals(objName)){
            excelString = getRestoreObject(rMap);
        }else if('Backup'.equals(objName)){
            excelString = getBackupObject(rMap);
        }
        return excelString;
    }
    public static  String getRestoreObject(Map<String, Object> rMap){
        String activityID = (String) rMap.get('restoreActivityId');
        String rUser = (String) rMap.get('restoreUser');
        String rDateTime = (String) rMap.get('restoreDateTime');
        String duration  = (String) rMap.get('Duration');
        String records  = (String) rMap.get('Records');
        String size  = (String) rMap.get('Size');
        String apiCalls  = (String) rMap.get('APICalls');
        String status  = (String) rMap.get('Status');
        string recordString = activityID+','+rUser+','+rDateTime+','+ duration +','+records
            +','+size +','+apiCalls +','+status +'\n';
        return recordString;
    } 
    
    public static  String getBackupObject(Map<String, Object> rMap){
        Integer activityID = (Integer) rMap.get('backupId');
        String rUser = (String) rMap.get('idUser');
        Long rDateTime = (Long) rMap.get('tmStamp');
        String duration  = (String) rMap.get('strTotDuration');
        Integer records  = (Integer) rMap.get('nbrTotRecords');
        String size  = (String) rMap.get('Size');        
        Integer apiCalls = (Integer) rMap.get('nbrTotApi');
        String status  = (String) rMap.get('objProcStatus');
        string recordString = activityID+','+rUser+','+rDateTime+','+ duration +','+records
            +','+size +','+apiCalls +','+status +'\n';
        return recordString;
    }
    
    @AuraEnabled
    public static String sendEmailNotification(String sfOrgId, String objects, String mMail, String subject){
        string header = 'Activity ID, User , Date/Time, Duration, Records, Size, API Calls, Status \n';
        string finalstr = header ;
        string csvname = '';
        System.debug('subject:'+subject);
        if(subject.contains('Restore')){
            csvname = 'Restore';
        }else if(subject.contains('Backup')){
        	csvname = 'Backup';
        }
        List<Object> objectsList =(List<Object>) JSON.deserializeUntyped(objects);
		for(Object a: objectsList)
        {
            Map<String, Object> rMap = (Map<String, Object>) a;
            String recordString = getObject(csvname, rMap);
            finalstr = finalstr +recordString;
        }
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        blob csvBlob = Blob.valueOf(finalstr);
        csvname += '_'+sfOrgId+'.csv';
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
          String[] toAddresses = new list<string>  {mMail};
          //String[] toAddresses = new list<string> {'jayashree.j@autorabit.com'};//, 'naresh.v@autorabit.com', 'leelapavan.a@autorabit.com'};
        email.setSubject(subject);
        email.setToAddresses( toAddresses );
        email.setSenderDisplayName('ARVault User'); 
        email.setPlainTextBody('Please find attached the activity list.');
        
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        
          return 'Success';  
    }
    
    @AuraEnabled 
    public static boolean isEmailAttachment(String sfOrgId, String objects, String subject){
        string header = 'Activity ID, User , Date/Time, Duration, Records, Size, API Calls, Status \n';
        string finalstr = header ;
        string csvname = '';
        if(subject.contains('Restore')){
            csvname = 'Restore';
        }else if(subject.contains('Backup')){
        	csvname = 'Backup';
        }
        System.debug('subject:'+subject+':csvname:'+csvname);
        List<Object> objectsList =(List<Object>) JSON.deserializeUntyped(objects);
		for(Object a: objectsList)
        {
            Map<String, Object> rMap = (Map<String, Object>) a;
            String recordString = getObject(csvname, rMap);
            finalstr = finalstr +recordString;
        }
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        blob csvBlob = Blob.valueOf(finalstr);
        csvname += '_'+sfOrgId+'.csv';        
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        if(csvBlob != null && csvBlob.size() > 0){
            return true;
        }
        return false;
    }

	@AuraEnabled    
    public static boolean uploadCSVFile(String sfOrgId, String objects){
        boolean isUploaded = false;
        string header = 'Activity ID, User , Date/Time, Duration, Records, Size, API Calls, Status \n';
        string finalstr = header ;
        string csvname = 'Activity';
        
        List<Object> objectsList =(List<Object>) JSON.deserializeUntyped(objects);
		for(Object a: objectsList)
        {
            Map<String, Object> rMap = (Map<String, Object>) a;
            String recordString = getObject(csvname, rMap);
            finalstr = finalstr +recordString;
        }
        blob csvBlob = Blob.valueOf(finalstr);
        csvname += '_'+sfOrgId+'.csv';
        String jsonInput = '{"sfOrgId": "'+sfOrgId+'", "objects": "'+objects+'"}';
        String serviceURL = baseURL + '/getSfFields';
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(serviceURL);
        req.setMethod('PUT');
        req.setHeader('Content-type', 'application/json');
        
        // Specify the required user name and password to access the endpoint
        // As well as the header and header information
        
        String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
        String password = 'Naresh@7';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        //req.setBody(jsonInput);
        req.setBodyAsBlob(csvBlob);
        
        // Create a new http object to send the request object
        // A response object is generated as a result of the request  
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        //string resp1 = res.getBody();
        Map<String, Object> responseObjects = new Map<String, Object>();
        if(res.getStatusCode() == 200)
        { 
            system.debug('Authentication success!!!' + res);
            System.debug(res.getBody());
            isUploaded = true;//(boolean) JSON.deserializeUntyped(res.getBody());
        } 
        else
        {
            system.debug('Authentication failed!!!' + res + res.getStatusCode());
  			isUploaded = false; //(boolean) JSON.deserializeUntyped(res.getBody());
        }
        return isUploaded;
    }
    
}