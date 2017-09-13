public class ARVaultService {

   public static String baseURL = 'http://54.202.231.145:8080/ARVault';
  
    @AuraEnabled
    public static Map<String, Object>  getOrgBackupConfig(String sfOrgId){
          String userInfo = '{"sfOrgId":"'+sfOrgId
         +'"}';
	  String serviceURL = baseURL + '/getSforgBakupCfg';
        //Map<String, Object> generateResponse
      Map<String, Object> responseList =  generateResponse(serviceURL, userInfo);
      System.debug(''+responseList);
        return responseList;
    }
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
    public static String basicAuthCallout(String orgName, String userName, String pwd, String sfSecToken, String idUser){
 
       System.debug(''+orgName+', '+userName+', '+pwd+', '+sfSecToken+','+idUser);
     String userInfo = '{"nmLable":"'+orgName
         +'", "sfNmUser":"'+userName
         +'","sfTxPwd":"'+pwd
          +'","sfSecToken":"'+sfSecToken
         +'", "idUser":"'+idUser
         +'"}';
	 String serviceURL = baseURL + '/addSforgEnvi';
    
     Map<String, Object> responseList = generateResponse(serviceURL, userInfo);
     String responseStr = (String) responseList.get('idSforg');  
       System.debug(''+responseStr);
     return responseStr;  
   }
    // Called on SetUp Page to test SF connection.
    @AuraEnabled
    public static String testSfConnection(String userName, String password, String secToken){
     String userInfo = '{"sfNmUser":"'+userName+'","sfTxPwd":"'+password+'", "sfSecToken": "'+secToken+'"}';
	 String serviceURL = baseURL + '/testSfConnection';
     String responseList = generateResponseStr(serviceURL, userInfo);
     System.debug(''+responseList);
     return responseList;  
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
    public static void startBackup (String sfOrgID, String idUser, String backupType, String bkpLabel) {
        String jsonInput = '{"sfOrgId": "'+sfOrgID+'","idUser": "'+idUser+'","backupType": "'+backupType+'","bkpLabel": "'+bkpLabel+'"}';
        String serviceURL = baseURL + '/startBackup';
         System.debug('ok:'+jsonInput); 
        Map<String, Object> responseList = generateResponse(serviceURL, jsonInput);
        
      }
    
	 @AuraEnabled
     public static List<Object> getListOfBackups (String sfOrgID) {
          String jsonInput = '{"sfOrgId": "'+sfOrgID+'"}';
          String serviceURL = baseURL + '/getAllSforgBakupStatus';
          List<Object> responseList = generateListResponse(serviceURL, jsonInput);
          System.debug('responseList:'+responseList);
          return responseList;
      }
    
    public static Map<String, Object> convertToObjectList(Map<String, Object> response){
        
        Map<String, Object> resultCritList =  (Map<String, Object>) response.get('resultCriteria');          
        List<Object> resultList = new List<Object>(); 
        for (String strKey : resultCritList.keyset() )  {
            Map<String, Object> mObj = (Map<String, Object>) resultCritList.get(strKey);
            resultList.add(mObj);
        }
        response.put('resultCriteria', resultList);
        return response;
    }
    
      @AuraEnabled
      public static Map<String, Object> getBackupObject (String sfOrgID, Integer backupID) {
          String jsonInput = '{"sfOrgId": "'+sfOrgID+'", "backupId" : '+backupID+'}';
          String serviceURL = baseURL + '/getSforgBakupStatus';
              
          Map<String, Object> responseList = generateResponse(serviceURL, jsonInput);
          responseList = convertToObjectList(responseList);
          return responseList;
      }
    
    @AuraEnabled
    public static List<Object> getBackupsForRestore (String sfOrgID, String sYear, String sMonth, String sFromDate, String sToDate) {
           /*String sfOrgID = '00D6F000001OOISUA4';   Integer sYear = 2017;    Integer sMonth = 9;   Date sFromDate = Date.today() - 2; Date sToDate =  Date.today();*/
          boolean isMonthYear = (sYear != null && sMonth != null) ?  true : false ;
                    
          List<Object> backupList = getListOfBackups(sfOrgID);
          List<Object> returnObjList = new List<Object>();
          for(Object bObject: backupList){
              Map<String, Object> mapObj = (Map<String, Object>) bObject;
              String procStatus =  (String) mapObj.get('objProcStatus');
               //System.debug('getBackupsForRestore:procStatus:'+procStatus);
              if('COMPLETED'.equals((procStatus))){   
                  mapObj = convertToObjectList(mapObj);
                  DateTime backupDate = DateTime.newInstance( (Long) mapObj.get('tmStamp'));
                  if(isMonthYear){
                        if((backupDate.year() == Integer.valueOf(sYear)) && (backupDate.month() == Integer.valueOf(sMonth))){
                              returnObjList.add(mapObj);
                        }    
                 }else{
                        Date bDate =  backupDate.date();
                        if(bDate > Date.valueOf(sFromDate) && bDate < Date.valueOf(sToDate))  {
                              returnObjList.add(mapObj);
                        } 
                 }
              }
          }
          System.debug('getBackupsForRestore:returnObjList:'+returnObjList);
          return returnObjList;
      }

      @AuraEnabled
    public static List<Object> getRecordsFromBackup (Integer backupID, String objName, String fieldName) {
        
        String resp = getRecordsJSONInput(); 
        Map<String, Object> objMap = (Map<String, Object>) JSON.deserializeUntyped(resp);
        System.debug('getRecordsFromBackup:objMap'+objMap);
        List<Object> objList = new List<Object>(); 
        for(String strKey: objMap.keySet()){
            Map<String, Object> mapObj = (Map<String, Object>) objMap.get(strKey);
            objList.add(mapObj);
        }
        System.debug('getRecordsFromBackup:objList'+objList);
        return objList;
        /*String jsonInput = '{"backupId": '+backupID+', "objName" : "'+objName+'"}';
        System.debug(jsonInput);
        String serviceURL = baseURL + '/getRecordsFromBackup';
        List<Object> fieldList = new List<Object>(); 
        Map<String, Object> responseList = generateResponse(serviceURL, jsonInput);
        for(String strKey: responseList.keySet()){
            Map<String, Object> mapObj = (Map<String, Object>) responseList.get(strKey);
            fieldList.add(mapObj);
        }
        System.debug('responseList:'+responseList);
        return responseList;*/
    }
    
    @AuraEnabled
    public static String updateSfOrg(String idSforg, String nmLable, String sfNmUser,String sfTxPwd, String sfSecToken, String idUser){
                 String userInfo = '{"idSforg":"'+idSforg
            +'","nmLable":"'+nmLable
            +'", "sfNmUser": "'+sfNmUser
            +'","sfTxPwd":"'+sfTxPwd
            +'","sfSecToken":"' +sfSecToken
            +'", "idUser": "'+idUser+'"}';
            String serviceURL = baseURL + '/updateSforgEnvi';
                 String responseList = generateResponseStr(serviceURL, userInfo);
                 System.debug(''+responseList);
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
      public static List<Object> getFObjectsPerBackup (String backupID, String objName) {
          // after webservice integration we will use the reponse string
          String resp = getRecordsJSONInput();
          Map<String, Object> objMap = (Map<String, Object>) JSON.deserializeUntyped(resp);
          System.debug('getFObjectsPerBackup:objMap'+objMap);
          List<Object> fieldList= new List<Object>(); 
          Integer count = 0;
          for(String strKey: objMap.keySet()){
              if(count == 0){
                  Map<String, Object> mapObj = (Map<String, Object>) objMap.get(strKey);
                  for(String fieldKey: mapObj.keySet()){
                      fieldList.add(fieldKey);
                  }
                  count++;
              }
          }
          System.debug('getFObjectsPerBackup:fieldList'+fieldList);
          return fieldList;
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
        Integer duration  = (Integer) rMap.get('strTotDuration');
        Integer records  = (Integer) rMap.get('nbrTotRecords');
        Integer size  = (Integer) rMap.get('Size');        
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
    
    public static String getRecordsJSONInput(){
        String inputStr = '{ "1": {'+
            '"ShippingLatitude": "",'+
            '"LastModifiedDate": "2017-04-07T06:17:00.000Z",'+
            '"BillingCity": "",'+
			'"JigsawCompanyId": "",'+
			'"SLA__c": "Silver",'+
			'"NaicsCode": "",'+
			'"Name": "312 Constitution Place Austin, TX 78767 USA",'+
			'"Industry": "Electronics",'+
			'"CreatedById": "0056F000006jFL3QAM",'+
			'"OperatingHoursId": "",'+
			'"TickerSymbol": "EDGE",'+
			'"BillingGeocodeAccuracy": "",'+
			'"AccountSource": "",'+
			'"BillingPostalCode": "",'+
			'"DandbCompanyId": "",'+
			'"PhotoUrl": "/services/images/photo/0016F00001xGo2wQAC",'+
			'"MasterRecordId": "",'+
			'"IsDeleted": "false",'+
			'"LastViewedDate": "",'+
			'"ShippingGeocodeAccuracy": "",'+
			'"DunsNumber": "",'+
			'"Sic": "6576",'+
			'"ShippingStreet": "312 Constitution Place\\nAustin, TX 78767\\nUSA",'+
			'"CleanStatus": "Pending",'+
			'"ShippingPostalCode": "",'+
			'"YearStarted": "",'+
			'"CreatedDate": "2017-03-13T23:53:33.000Z",'+
			'"CustomerPriority__c": "Medium",'+
			'"ShippingState": "",'+
			'"DemoField__c": "",'+
			'"Id": "0016F00001xGo2wQAC",'+
			'"SicDesc": "",'+
			'"BillingState": "TX",'+
			'"AnnualRevenue": "1.39E8",'+
			'"Jigsaw": "",'+
			'"Active__c": "Yes",'+
			'"Site": "",'+
			'"Ownership": "Public",'+
			'"Description": "Edge, founded in 1998, is a start-up based in Austin, TX. The company designs and manufactures a device to convert music from one digital format to another. Edge sells its product through retailers and its own website.",'+
			'"Rating": "Hot",'+
			'"Website": "http://edgecomm.com",'+
			'"LastReferencedDate": "",'+
			'"BillingLatitude": "",'+
			'"NumberOfEmployees": "1000",'+
			//'"BillingAddress": "XmlObjectWrapper{name={urn:sobject.partner.soap.sforce.com}BillingAddress, xmlizable=[Address [Location  latitude='null'\\n longitude='null'\\n]\\n city='null'\\n country='null'\\n countryCode='null'\\n geocodeAccuracy='null'\\n postalCode='null'\\n state='TX'\\n stateCode='null'\\n street='Austin'\\n]\\n}",'+
			'"OwnerId": "0056F000006jFL3QAM",'+
			'"SLASerialNumber__c": "2657",'+
			'"BillingLongitude": "",'+
			'"Tradestyle": "",'+
			'"Phone": "(512) 757-6000",'+
			'"NumberofLocations__c": "2.0",'+
			'"UpsellOpportunity__c": "Maybe",'+
			'"ShippingCountry": "",'+
			'"ShippingCity": "",'+
			'"ParentId": "",'+
			'"NaicsDesc": "",'+
			'"AutorabitExtId__c": "0016F00001tIb5HQAS",'+
			'"AccountNumber": "CD451796",'+
			'"SystemModstamp": "2017-04-07T06:17:00.000Z",'+
			'"Type": "Customer - Direct",'+
			'"BillingCountry": "",'+
			'"SLAExpirationDate__c": "2017-02-13",'+
			'"BillingStreet": "Austin",'+
			//'"ShippingAddress": "XmlObjectWrapper{name={urn:sobject.partner.soap.sforce.com}ShippingAddress, xmlizable=[Address [Location  latitude='null'\\n longitude='null'\\n]\\n city='null'\\n country='null'\\n countryCode='null'\\n geocodeAccuracy='null'\\n postalCode='null'\\n state='null'\\n stateCode='null'\\n street='312 Constitution Place\\nAustin, TX 78767\\nUSA'\\n]\\n}",'+
			'"LastActivityDate": "",'+
			'"Fax": "(512) 757-9000",'+
			'"LastModifiedById": "0056F000006jFL3QAM",'+
			'"ShippingLongitude": ""'+
		'}, "2": {'+
			'"ShippingLatitude": "",'+
			'"LastModifiedDate": "2017-04-07T06:17:00.000Z",'+
			'"BillingCity": "",'+
			'"JigsawCompanyId": "",'+
			'"SLA__c": "Silver",'+
			'"NaicsCode": "",'+
			'"Name": "2 Place Jussieu",'+
			'"Industry": "Construction",'+
			'"CreatedById": "0056F000006jFL3QAM",'+
			'"OperatingHoursId": "",'+
			'"TickerSymbol": "PYR",'+
			'"BillingGeocodeAccuracy": "",'+
			'"AccountSource": "",'+
			'"BillingPostalCode": "75251",'+
			'"DandbCompanyId": "",'+
			'"PhotoUrl": "/services/images/photo/0016F00001xGo2xQAC",'+
			'"MasterRecordId": "",'+
			'"IsDeleted": "false",'+
			'"LastViewedDate": "",'+
			'"ShippingGeocodeAccuracy": "",'+
			'"DunsNumber": "",'+
			'"Sic": "4253",'+
			'"ShippingStreet": "2 Place Jussieu",'+
			'"CleanStatus": "Pending",'+
			'"ShippingPostalCode": "75251",'+
			'"YearStarted": "",'+
			'"CreatedDate": "2017-03-13T23:53:33.000Z",'+
			'"CustomerPriority__c": "",'+
			'"ShippingState": "",'+
			'"DemoField__c": "",'+
			'"Id": "0016F00001xGo2xQAC",'+
			'"SicDesc": "",'+
			'"BillingState": "",'+
			'"AnnualRevenue": "9.5E8",'+
			'"Jigsaw": "",'+
			'"Active__c": "Yes",'+
			'"Site": "",'+
			'"Ownership": "Public",'+
			'"Description": "",'+
			'"Rating": "",'+
			'"Website": "www.pyramid.com",'+
			'"LastReferencedDate": "",'+
			'"BillingLatitude": "",'+
			'"NumberOfEmployees": "2680",'+
			//'"BillingAddress": "XmlObjectWrapper{name={urn:sobject.partner.soap.sforce.com}BillingAddress, xmlizable=[Address [Location  latitude='null'\\n longitude='null'\\n]\\n city='null'\\n country='France'\\n countryCode='null'\\n geocodeAccuracy='null'\\n postalCode='75251'\\n state='null'\\n stateCode='null'\\n street='Paris'\\n]\\n}",'+
			'"OwnerId": "0056F000006jFL3QAM",'+
			'"SLASerialNumber__c": "9840",'+
			'"BillingLongitude": "",'+
			'"Tradestyle": "",'+
			'"Phone": "(014) 427-4427",'+
			'"NumberofLocations__c": "17.0",'+
			'"UpsellOpportunity__c": "Maybe",'+
			'"ShippingCountry": "France",'+
			'"ShippingCity": "Paris",'+
			'"ParentId": "",'+
			'"NaicsDesc": "",'+
			'"AutorabitExtId__c": "0016F00001tIb5JQAS",'+
			'"AccountNumber": "CC213425",'+
			'"SystemModstamp": "2017-04-07T06:17:00.000Z",'+
			'"Type": "Customer - Channel",'+
			'"BillingCountry": "France",'+
			'"SLAExpirationDate__c": "2017-08-16",'+
			'"BillingStreet": "Paris",'+
			//'"ShippingAddress": "XmlObjectWrapper{name={urn:sobject.partner.soap.sforce.com}ShippingAddress, xmlizable=[Address [Location  latitude='null'\\n longitude='null'\\n]\\n city='Paris'\\n country='France'\\n countryCode='null'\\n geocodeAccuracy='null'\\n postalCode='75251'\\n state='null'\\n stateCode='null'\\n street='2 Place Jussieu'\\n]\\n}",'+
			'"LastActivityDate": "",'+
			'"Fax": "(014) 427-4428",'+
			'"LastModifiedById": "0056F000006jFL3QAM",'+
			'"ShippingLongitude": ""'+
            '}  }';
        
        return inputStr;
    }
    
}