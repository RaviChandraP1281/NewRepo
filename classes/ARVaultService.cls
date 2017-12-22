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
    public static String basicAuthCallout(String orgName, 
                                          String userName, 
                                          String pwd, 
                                          String sfSecToken, 
                                          String sfAuthType,
                                          String idUser, 
                                          String refreshToken, 
                                          String instanceURL){
 
       System.debug(''+orgName+', '+userName+', '+pwd+', '+sfSecToken+','+idUser);
     String userInfo = '{"nmLable":"'+orgName
         +'", "sfNmUser":"'+userName
         +'","sfTxPwd":"'+pwd
         +'","sfSecToken":"'+sfSecToken
         +'","sfAuthType":"'+sfAuthType
         +'", "idUser":"'+idUser
         +'", "sfAccessToken":"'
         +'", "sfRefreshToken":"'+refreshToken
         +'", "sfInstanceUrl":"'+instanceURL
         +'"}';
	 String serviceURL = baseURL + '/addSforgEnvi';
    
     Map<String, Object> responseList = generateResponse(serviceURL, userInfo);
     String responseStr = (String) responseList.get('idSforg');  
       System.debug(''+responseStr);
     return responseStr;  
   }
    // Called on SetUp Page to test SF connection.
    @AuraEnabled
    public static String testNewSfConnection(String userName, String password, String secToken, String authType, String instanceURL){
     String userInfo = '{"sfNmUser":"'+userName
         				+'","sfTxPwd":"'+password
         				+'", "sfSecToken": "'+secToken
         				+'", "sfInstanceUrl":"'+ instanceURL
         				+'", "sfAuthType": "'+ authType
                        +'"}';
	 String serviceURL = baseURL + '/testSfConnection';
     String responseList = generateResponseStr(serviceURL, userInfo);
     System.debug(''+responseList);
     return responseList;  
   }
    
    @AuraEnabled
    public static String testSfConnection(String sfOrgID){
      String userInfo = '{"idSforg":"'+sfOrgID
          				+'"}';
	 String serviceURL = baseURL + '/testSfConnection';
     String responseList = generateResponseStr(serviceURL, userInfo);
     System.debug(''+responseList);
     return responseList;  
   }

    @AuraEnabled
    public static String updateSfOrg(String idSforg, 
                                     String nmLable, 
                                     String sfNmUser,
                                     String sfTxPwd, 
                                     String sfSecToken, 
                                     String idUser, 
                                     String accessToken, 
                                     String sfAuthType,
                                     String instanceURL){
                 String userInfo = '{"idSforg":"'+idSforg
            +'","nmLable":"'+nmLable
            +'", "sfNmUser": "'+sfNmUser
            +'","sfTxPwd":"'+sfTxPwd
            +'","sfSecToken":"' +sfSecToken
            +'", "idUser": "'+idUser
            +'", "sfAccessToken":"'+accessToken
         	+'", "sfInstanceUrl":"'+instanceURL   
            +'","sfAuthType":"'+sfAuthType
            +'"}';
                                         //  +'","sfAuthType":"'+sfAuthType
            String serviceURL = baseURL + '/updateSforgEnvi';
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
        
        // Specify the required user name and password to access the endpoint with header info
        
        String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
        String password = 'Naresh@7';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setBody(jsonInput);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        Map<String, Object> responseObjects = new Map<String, Object>();
        if(res.getStatusCode() == 200){
            
            system.debug('Authentication success!!!' + res);
            System.debug(res.getBody());
            responseObjects = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());                         
        }else{
            
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
          return responseList;
      }
    
    public static Map<String, Object> convertToObjectList(Map<String, Object> response){
        Map<String, Object> resultCritList =  (Map<String, Object>) response.get('resultCriteria');          
        List<Object> resultList = new List<Object>();
        if(resultCritList != null){
        	for (String strKey : resultCritList.keyset() )  {
                Map<String, Object> mObj = (Map<String, Object>) resultCritList.get(strKey);
                resultList.add(mObj);
            }
            response.put('resultCriteria', resultList);        
        }        
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
      public static List<String> getBackupsLog (Integer backupID) {
        String jsonInput = '{"backupId" : '+backupID+'}';
        String serviceURL = baseURL + '/getBackupLog';
        String responseStr = generateResponseStr(serviceURL, jsonInput);
        List<String> responseString = new List<String>();
        if(responseStr != null)
            responseString = responseStr.split('\n');
        System.debug('responseString:'+responseString);
        return responseString;
    }
    
    @AuraEnabled
    public static List<Object> getBackupsForRestore (String sfOrgID, String sYear, String sMonth, String sFromDate, String sToDate) {
           /*String sfOrgID = '00D6F000001OOISUA4';   Integer sYear = 2017;    Integer sMonth = 9;   Date sFromDate = Date.today() - 2; Date sToDate =  Date.today();*/
          boolean isMonthYear = (sYear != null && sMonth != null) ?  true : false ;
          System.debug('getBackupsForRestore:sfOrgID:'+sfOrgID+sYear+sMonth+sFromDate+sToDate);          
          List<Object> backupList = getListOfBackups(sfOrgID);
          List<Object> returnObjList = new List<Object>();
          for(Object bObject: backupList){
              Map<String, Object> mapObj = (Map<String, Object>) bObject;
              String procStatus =  (String) mapObj.get('objProcStatus');
               System.debug('getBackupsForRestore:procStatus:'+procStatus);
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
    public static List<Object> getRecordsFromBackup (Integer backupID, String objName) {
        
        String jsonInput = '{"backupId": '+backupID+', "objName" : "'+objName+'"}';
        String serviceURL = baseURL + '/getRecordsFromBackup';
        List<Object> fieldList = new List<Object>(); 
        Map<String, Object> responseList = responseSpecTimeout(serviceURL, jsonInput);
        List<Object> fields = getRecordFieldList(responseList);
        for(String strKey: responseList.keySet()){
            Map<String, Object> mapObj = (Map<String, Object>) responseList.get(strKey);
            Map<String, Object> newMapObj = new Map<String, Object>();
            Integer icount=0;
            for(Object key1: fields){
                String skey1 = (String) key1; 
                if(icount < 5){
                    String str1 = 'Column'+icount;                    
                    Object o = (Object) mapObj.get(skey1);
                    newMapObj.put(str1, o);                     
                }                
                icount++;
            }
            newMapObj.put('ColumnName', fields);
            newMapObj.put('Id', mapObj.get('Id'));
            fieldList.add(newMapObj);                                                        
        }   
        System.debug('fieldList:'+fieldList);
        return fieldList;
    }
    
    @AuraEnabled
    public static List<Object> getChangeViewRecords (Integer backupID, String objName, List<Object> recordColumns) {
        
        String jsonInput = '{"backupId": '+backupID+', "objName" : "'+objName+'"}';
        String serviceURL = baseURL + '/getRecordsFromBackup';
        List<Object> fieldList = new List<Object>(); 
        Map<String, Object> responseList = responseSpecTimeout(serviceURL, jsonInput);
        for(String strKey: responseList.keySet()){
            Map<String, Object> mapObj = (Map<String, Object>) responseList.get(strKey);
            Map<String, Object> newMapObj = new Map<String, Object>();
            Integer icount =0;
            for(Object key1: recordColumns){
                String skey1 = (String) key1; 
                Object o = (Object) mapObj.get(skey1);
                String str1 = 'Column'+icount;                    
                newMapObj.put(str1, o);                                         
                icount++;
            }
            newMapObj.put('Id', mapObj.get('Id'));
            fieldList.add(newMapObj);                                                        
        }   
        System.debug('fieldList:'+fieldList);
        return fieldList;
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
      public static List<Object> getListOfRestores (String sfOrgId) {
          String jsonInput = '{"sfOrgId":"'+sfOrgId +'" }';
          System.debug(jsonInput);
          String serviceURL = baseURL + '/getAllRestoreStats';
          List<Object> objList = (List<Object>) generateListResponse(serviceURL, jsonInput);
          System.debug(objList);
          return objList;
      }

	 @AuraEnabled
      public static Map<String, Object> getRestoreObject (Integer restoreID) {
          String jsonInput = '{"idRestore" : '+restoreID+'}';
          String serviceURL = baseURL + '/getSpecificRestoreStats';
              
          Map<String, Object> responseList = generateResponse(serviceURL, jsonInput);
          responseList = convertToObjectList(responseList);
          return responseList;
      }    
          
	  @AuraEnabled
      public static String startRestore (Integer backupId, String srcSfOrgId, String destSfOrgId, String objectName, List<Object> recordIDs, String userId) {
          System.debug('json:'+backupId+srcSfOrgId+destSfOrgId+objectName+recordIDs+userId);
          String recordIdList = '{';
          if(recordIDs != null && recordIDs.size() > 0){
              recordIdList = '{"'+objectName +'": [';
			  integer len = recordIDs.size();
			  integer i =0;
                for(Object o : recordIDs){
                    String recordID = (String) o;
                    recordIdList = recordIdList +' "'+ recordID+'" ';
                    if(i < len-1){
                        recordIdList += ',';
                    }
                    i++;
                }
                recordIdList += ']';
                System.debug(recordIdList);                                                  
          }                     
          recordIdList += '}';
          
          String jsonInput = '{"backupId": '+backupId +','
              				+' "srcSfOrgId":  "'+srcSfOrgId+'", '
              				+' "destSfOrgId": "'+destSfOrgId+'", '
              				+' "recordIds" : '+recordIdList+ ' , '
              				+' "userId": "'+userId+'"}';
          System.debug('json:'+jsonInput);
          String serviceURL = baseURL + '/startRestore';
          String returnStr = (String) generateResponseStr(serviceURL, jsonInput);
          System.debug('startRestore:'+returnStr);
          return returnStr;
      }        

    
     public static List<Object> getRecordFieldList ( Map<String, Object> responseList) {
        System.debug('getFieldList:responseList'+responseList);
          List<Object> fieldList = new List<Object>();
          for(String strKey: responseList.keySet()){
              Map<String, Object> mapObj = (Map<String, Object>) responseList.get(strKey);
              for(String fieldKey: mapObj.keySet()){
                  fieldList.add(fieldKey);
              }
          }
          System.debug('getFieldList:'+fieldList);
          return fieldList;
      }
    
     @AuraEnabled
    public static List<Object> getListOfCompareBackups (String sfOrgID, String fromDate, String toDate) {
          List<Object> responseList = getListOfBackups (sfOrgID);
          List<Object> backupList = new List<Object>();
          System.debug('responseList:'+responseList);
          boolean isDtChkReq = false;    
          if((fromDate != null && toDate != null) && (fromDate != '' && toDate != '')){
          		isDtChkReq = true;        
          }    
          for(Object bObject: responseList){
             Map<String, Object> mapObj = (Map<String, Object>) bObject;
             if(mapObj != null && mapObj.size() > 0){
                 String bStatus = (String) mapObj.get('objProcStatus');
         		 // Get Only Completed Backups
                 if(bStatus.toUpperCase() == 'COMPLETED'){
                     Long backupTime = (Long) mapObj.get('tmStamp');
                     if(isDtChkReq){
                         String[] fDateArr = fromDate.split('-');
                         String[] tDateArr = toDate.split('-');
                         DateTime fDt = DateTime.newInstance(Integer.valueOf(fDateArr[0]), Integer.valueOf(fDateArr[1]), Integer.valueOf(fDateArr[2]));
                         DateTime tDt = DateTime.newInstance(Integer.valueOf(tDateArr[0]), Integer.valueOf(tDateArr[1]), Integer.valueOf(tDateArr[2]));
                         System.debug('fromDate:'+backupTime +':'+fDt.getTime() );
                         System.debug('fromDate:'+backupTime +':'+tDt.getTime() );
                         if( (backupTime >= fDt.getTime() ) &&  (backupTime <= tDt.getTime()) ){
                             backupList.add(mapObj);    
                         }                                               
                     }else{
                         backupList.add(mapObj);    
                     }                     
                 }
             }
         }
          return backupList;
      }

      @AuraEnabled
      public static List<Object> getMultipleBackupObjects (Integer fbackupID, Integer sbackupID) {          
          
          String jsonInput = '{"backupIds" : ['+fbackupID+','+sbackupID+']}';
          System.debug('jsonInput:'+jsonInput);
          String serviceURL = baseURL + '/getMultipleBackupStatuses';
              
          List<Object> responseList = generateListResponse(serviceURL, jsonInput);
          List<Object> returnList = new List<Object>();
          System.debug('responseList:'+responseList);
          if(responseList != null && responseList.size() > 0){
              
              Map<String, Object> responseMap1 = (Map<String, Object>) responseList[0];
              Map<String, Object> responseMap2 = (Map<String, Object>) responseList[1];
              
              //responseList = compareObjectList(responseMap1, responseMap2);              
              responseMap1 = convertToObjectList((Map<String, Object>) responseList.get(0));
              responseMap2 = convertToObjectList((Map<String, Object>) responseList.get(1));                            
              returnList.add(responseMap1);
              returnList.add(responseMap2);              
          }else{
              returnList = responseList;
          }
          System.debug('responseList:'+returnList);          
          return returnList;
      }
    
      public static List<Object> compareObjectList(Map<String, Object> response1, Map<String, Object> response2){
        
        Map<String, Object> resultCritList1 =  (Map<String, Object>) response1.get('resultCriteria');
        Map<String, Object> resultCritList2 =  (Map<String, Object>) response2.get('resultCriteria');
        Map<String, Object> resultMap1 = new Map<String, Object>();
        Map<String, Object> resultMap2 = new Map<String, Object>();
        
        for (String strKey1 : resultCritList1.keyset() )  {
            Map<String, Object> mObj1 = (Map<String, Object>) resultCritList1.get(strKey1);
            Map<String, Object> mObj2 = (Map<String, Object>) resultCritList2.get(strKey1);
            boolean isDiffDur = false;
            boolean isDiffApi = false;
            boolean isDiffRec = false;
            boolean isDiffSuc = false;
            boolean isDiffSize = false;
            if(mObj1.get('objname').equals(mObj2.get('objname'))){
                if(mObj1.get('duration') != mObj2.get('duration')){
                    isDiffDur = true;
                }
                if(mObj1.get('apicalls') != mObj2.get('apicalls')){
                    isDiffApi = true;
                }
                if(mObj1.get('records') != mObj2.get('records')){
                    isDiffRec = true;
                }
                if(mObj1.get('successcount') != mObj2.get('successcount')){
                	isDiffSuc = true;
                }
                if(mObj1.get('size') != mObj2.get('size')){
                	isDiffSize = true;
                }
                mObj1.put('isDiffDur', isDiffDur);
                mObj1.put('isDiffApi', isDiffApi);
                mObj1.put('isDiffRec', isDiffRec);
                mObj1.put('isDiffSuc', isDiffSuc);
                mObj1.put('isDiffSize', isDiffSize);
                
                mObj2.put('isDiffDur', isDiffDur);
                mObj2.put('isDiffApi', isDiffApi);
                mObj2.put('isDiffRec', isDiffRec);                        
                mObj2.put('isDiffSuc', isDiffSuc);                        
                mObj2.put('isDiffSize', isDiffSize);                                        
            }
            resultMap2.put(strKey1, mObj2);
            resultMap1.put(strKey1, mObj1);                        
        }
        
        response1.put('resultCriteria', resultMap1);
        response2.put('resultCriteria', resultMap2);
        List<Object> responseList = new List<Object>();
        responseList.add(response1);
        responseList.add(response2);
        return responseList;
    }
    
    @AuraEnabled
    public static List<Object> getUniqueObjects(List<Object> o1, List<Object> o2){
        List<Object> uniqueObjects = new List<Object>();
        Set<Object> uniqueSet = new Set<Object>();
        uniqueSet.addAll(o1);
        uniqueSet.addAll(o2);
        uniqueObjects.addAll(uniqueSet);        
        //System.debug('o1:'+o1.size()+'o2:'+o2.size()+'uo:'+uniqueObjects.size());
        System.debug('uniqueObjects:'+uniqueObjects);
        return uniqueObjects;
    }

    
	@AuraEnabled
    public static List<Object> getCompareBackups(String sfOrgID, Integer fbackupID, Integer sbackupID){
        List<Object> backupList = getMultipleBackupObjects(fbackupID, sbackupID);
        // No need to load object drop down list - Change of screen design.
        /*if(backupList != null && backupList.size() > 0){
        	Map<String, Object> fbackupMap = (Map<String, Object>) backupList[0];
            Map<String, Object> sbackupMap = (Map<String, Object>) backupList[1];
            
            List<Object> o1, o2; 
            if(fbackupMap != null && fbackupMap.size() > 0){
                o1 = (List<Object>) fbackupMap.get('resultCriteria');
            }
            if(sbackupMap != null && sbackupMap.size() > 0){
                o2 = (List<Object>) sbackupMap.get('resultCriteria');
            }
            if(o1 != null && o2 != null){
                backupList.add(getUniqueObjects(o1, o2));
            }else if(o1 != null){
                backupList.add(o1);
            }else if(o2 != null){
                backupList.add(o2);            
            }
                        
        }*/
        System.debug('backupList:'+backupList);
        return backupList;
    }
    
    @AuraEnabled
    public static List<Object> getCompareChangeView (String snapshotRec1, String snapshotRec2, String objName, List<Object> recordColumns) {
        // diff, name, value
        List<Object> snapshotList1 = (List<Object>)JSON.deserializeUntyped(snapshotRec1);
        List<Object> snapshotList2 = (List<Object>)JSON.deserializeUntyped(snapshotRec2);
        List<Object> li1 = new List<Object>();
        List<Object> li2 = new List<Object>();
        List<Object> fieldList1 = new List<Object>();
        for(Object o1: snapshotList1){            
            List<Object> snapshotRows = (List<Object>) o1;
			List<Object> newCollist = new List<Object>();           
            for(Object o2: snapshotRows){                
                Map<String, Object> snapshotCols = (Map<String, Object>) o2;
                String strColName = (String) snapshotCols.get('name');
                for(Object key1: recordColumns){
                    String skey1 = (String) key1;                 
                    if(skey1 == strColName){
                        newCollist.add(snapshotCols);
                    } 
                }                            
            }
            if(newCollist != null && newCollist.size() > 0){
                fieldList1.add(newCollist);                    
            }            
        }
        
        List<Object> fieldList2 = new List<Object>();             
        for(Object o1: snapshotList2){			
            List<Object> snapshotRows = (List<Object>) o1;
            List<Object> newCollist = new List<Object>();          
            for(Object o2: snapshotRows){
                Map<String, Object> snapshotCols = (Map<String, Object>) o2;
                String strColName = (String) snapshotCols.get('name');
                for(Object key1: recordColumns){
                    String skey1 = (String) key1;                 
                    if(skey1 == strColName){
                        newCollist.add(snapshotCols); 
                    } 
                }                               
            }
            if(newCollist != null && newCollist.size() > 0){
                fieldList2.add(newCollist);                                     
            }             			
        }
        
        List<Object> li = new List<Object>();
        li.add(fieldList1);
        li.add(fieldList2);
		return li;                       
    }
       
      @AuraEnabled
      public static List<Object> getRecordsForCompare (Integer fbackupID, Integer sbackupID, String objName) {
          List<Object> backupList = new List<Object>();          
          List<Object> recordList = getRecordList (fbackupID,sbackupID, objName);
          List<Object> record1 = new List<Object>();
          List<Object> record2 = new List<Object>();
          List<Object> rec1 = new List<Object>();
          List<Object> rec2 = new List<Object>();
          List<Object> fieldList = new List<Object>();
          if(recordList != null && recordList.size() == 5){
              record1 = (List<Object> ) recordList.get(0);
              System.debug('record1:'+record1);
              record2 = (List<Object> ) recordList.get(2);
              System.debug('record2:'+record2);
              rec1 = (List<Object> ) recordList.get(1);
              System.debug('rec1:'+rec1);
              rec2 = (List<Object> ) recordList.get(3);
              System.debug('rec2:'+rec2);
              fieldList = (List<Object> ) recordList.get(4);
              System.debug('fieldList:'+fieldList);
          }
          
          Set<Object> uniqueSet = new Set<Object>();
          uniqueSet.addAll(fieldList);
          List<Object> liFieldList = new List<Object>();
	      liFieldList.addAll(uniqueSet);
          backupList.add(rec1);
          backupList.add(rec2);              
          
          backupList.add(liFieldList);          
          backupList.add(record1);          
          backupList.add(record2);
          return backupList;		
      }
    
    @AuraEnabled
    public static List<Object> getRecordList(Integer fbackupID, Integer sbackupID, String objName){
        
        String jsonInput = '{"readerList": [{"backupId": '+fbackupID+', "objName" : "'+objName+'"}, '+ '{"backupId": '+sbackupID+', "objName" : "'+objName+'"} ] }';
        System.debug('jsonInput:'+jsonInput);
        String serviceURL = baseURL + '/getComparedRecords';//'/getRecordsFromMultipleBackups';
        Map<String, Object> responseList = responseSpecTimeout(serviceURL, jsonInput);
        return formatRecordMap(responseList);
    }
	public static List<Object> formatRecordMap(Map<String, Object> mapObj){
        List<Object> li = new List<Object>();
        List<Object> fieldList = new List<Object>();
        for(String key: mapObj.keySet()){
            //backupID
            Map<String, Object> m1 = (Map<String, Object>) mapObj.get(key); 
            List<Object> rowlist = new List<Object>();
			List<Object> displayRowlist = new List<Object>();
            for(String k1: m1.keySet()){
                // rowID
                Map<String, Object> rowMap = (Map<String, Object>) m1.get(k1);
                List<Object> collist = new List<Object>();
				List<Object> displayCollist = new List<Object>();				
				Integer icount=0;
                for(String rkey: rowMap.keySet()){
                    // colID
                    Map<String, Object> colMap = (Map<String, Object>) rowMap.get(rkey);
                    Map<String, Object> newMapObj = new Map<String, Object>();
                    String strColName = (String) colMap.get('name');
                    //if('BillingAddress' != strColName){ // remove this clause after testing
                    	fieldList.add(strColName);
                        if(icount < 5){
                             displayCollist.add(colMap);                                                           
                        }
                        icount++; 
                        collist.add(colMap);
                    //}    // remove this after test                
                }
                rowlist.add(collist);
				displayRowlist.add(displayCollist);
            }
            li.add(rowlist);
			li.add(displayRowlist);
        }
        li.add(fieldList);
        return li;
    }

    @AuraEnabled
    public static List<Object> getSpecificRecordValues(String snapshotRec1, String snapshotRec2, String fieldName){ 
        System.debug('start:'+ DateTime.now());
        List<Object> snapshotList1 = (List<Object>)JSON.deserializeUntyped(snapshotRec1);
        List<Object> snapshotList2 =  (List<Object>)JSON.deserializeUntyped(snapshotRec2);

        Set<Object> uniqueValues = new Set<Object>();
        for (Object o1: snapshotList1){
            Map<String, Object> map1 = (Map<String, Object>) o1;
            uniqueValues.add(map1.get(fieldName));
        }
        for (Object o2: snapshotList2){
            Map<String, Object> map2 = (Map<String, Object>) o2;
            uniqueValues.add(map2.get(fieldName));
        }
        System.debug(DateTime.now()+':uniqueValues:'+uniqueValues);
        List<Object> spRecObjects = new List<Object>();
        spRecObjects.addAll(uniqueValues);
        System.debug(DateTime.now()+':spRecObjects:'+spRecObjects);
        return spRecObjects;
    }
	
    @AuraEnabled
    public static List<Object> fetchSpecificRecordQuery(String snapshotRec1, String snapshotRec2, String fieldName, String fieldComp, String fieldValue){
    	List<Object> snapshotList1 = (List<Object>)JSON.deserializeUntyped(snapshotRec1);
        List<Object> snapshotList2 =  (List<Object>)JSON.deserializeUntyped(snapshotRec2);

        List<Object> valueObjects = new List<Object>();
        valueObjects.add(compareValueObjects(snapshotList1, fieldName, fieldComp, fieldValue));
        valueObjects.add(compareValueObjects(snapshotList2, fieldName, fieldComp, fieldValue));
        System.debug('valueObjects:0:'+valueObjects.get(0));
        System.debug('valueObjects:1:'+valueObjects.get(1));
        return valueObjects;
    }
    
    public static Map<String, Object> formatRecordCols(Map<String, Object> recordMap){
        Map<String, Object> newMapObj = new Map<String, Object>();
        newMapObj.put('Id', recordMap.get('Id'));
        Integer icount=0;
        for(String key: recordMap.keySet()){
            if(icount < 5){
                String str1 = 'Column'+icount;                    
                Object col = (Object) recordMap.get(key);
                newMapObj.put(str1, col);                     
            }                
            icount++;
        }
        return newMapObj;
    }
  	
    public static Long formatDateValue(String dateStr){
        String[]  arr = dateStr.split('T');
        String[] dateArr = arr[0].split('-');
        Integer timeLen = arr[1].length();
        String timeStr = arr[1].substring(0, timeLen-5);
        String[] timeArr = timeStr.split(':');
        DateTime dt = DateTime.newInstance(Integer.valueOf(dateArr[0]), Integer.valueOf(dateArr[1]), Integer.valueOf(dateArr[2]), 
                                           Integer.valueOf(timeArr[0]), Integer.valueOf(timeArr[1]), Integer.valueOf(timeArr[2]));
		return dt.getTime();
    }
    
    public static List<Object> compareValueObjects(List<Object> recordList, String fieldName, String fieldComp, String fieldValue){
        
        System.debug('fieldName:'+fieldName+fieldComp+fieldValue);
        boolean isNumericValue = false;
        if(fieldValue != null){
            isNumericValue =  fieldValue.isNumeric();
        }
        boolean isDateValue = fieldName.contains('Date') ? true : false;
        Integer iFieldValue = isNumericValue ? Integer.valueOf(fieldValue) : 0;
        
        List<Object> valueObjects = new List<Object>();
        for(Object o: recordList){
            Map<String, Object> map1 = (Map<String, Object>) o;
            String value1 = (String) map1.get(fieldName);
            
            Integer iValue1 = (value1 != null &&  value1.isNumeric()) ? Integer.valueOf(value1) : 0;
            if('eq'.equals(fieldComp)){
                if(fieldValue.equals(value1)){
                    valueObjects.add(formatRecordCols(map1));
                }
            }else if('ne'.equals(fieldComp)){
                if(!fieldValue.equals(value1)){
            		valueObjects.add(formatRecordCols(map1));
                }
            }else if('gt'.equals(fieldComp) && (isNumericValue || isDateValue)){
                if(isDateValue){
                    Long lValue1 = formatDateValue(value1);
                    Long lDtValue = formatDateValue(fieldValue);
                    if(lValue1 > lDtValue){
                        valueObjects.add(formatRecordCols(map1));
                    }
                }else{
                	if(iValue1 > iFieldValue ){
                    	valueObjects.add(formatRecordCols(map1));
                	}    
                }                
            }else if('ge'.equals(fieldComp) && (isNumericValue || isDateValue)){
                if(isDateValue){
                    Long lValue1 = formatDateValue(value1);
                    Long lDtValue = formatDateValue(fieldValue);
                    if(lValue1 >= lDtValue){
                        valueObjects.add(formatRecordCols(map1));
                    }
                }else{
                    if(iValue1 >= iFieldValue ){
                        valueObjects.add(formatRecordCols(map1));
                    }
                }
            }else if('lt'.equals(fieldComp)  && (isNumericValue || isDateValue)){
            	if(isDateValue){
                    Long lValue1 = formatDateValue(value1);
                    Long lDtValue = formatDateValue(fieldValue);
                    if(lValue1 < lDtValue){
                        valueObjects.add(formatRecordCols(map1));
                    }
                }else{
                    if(iValue1 < iFieldValue){
                        valueObjects.add(formatRecordCols(map1));
                    }
                }
            }else if('le'.equals(fieldComp) && (isNumericValue || isDateValue)){
            	if(isDateValue){
                    Long lValue1 = formatDateValue(value1);
                    Long lDtValue = formatDateValue(fieldValue);
                    if(lValue1 <= lDtValue){
                        valueObjects.add(formatRecordCols(map1));
                    }
                }else{
                    if(iValue1 <= iFieldValue){
                        valueObjects.add(formatRecordCols(map1));
                    }
                }
            }            
        }
        System.debug('valueObjects:'+valueObjects);
        return valueObjects;
    }
    
    public static Map<String, Object> responseSpecTimeout(String serviceURL, String jsonInput){
    	
        HttpRequest req = new HttpRequest();
        req.setEndpoint(serviceURL);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');
        
        String username = 'f939bec89dc549d9bb2a5ef164ac0eb5';
        String password = 'Naresh@7';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setBody(jsonInput);
        req.setTimeout(60000);            
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        Map<String, Object> responseObjects = new Map<String, Object>();
        if(res.getStatusCode() == 200)
        { 
            system.debug('Authentication success!!!' + res);
            //System.debug(res.getBody());
            responseObjects = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());                         
        } 
        else
        {
            system.debug('Authentication failed!!!' + res + res.getStatusCode());
  			responseObjects = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());                               	
        }
        return responseObjects;
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
        Integer activityID = (Integer) rMap.get('idRestore');
        Long rDateTime = (Long) rMap.get('tmStamp');
        DateTime dt = DateTime.newInstance(rDateTime);
        Date rDate = dt.date();
        Time rTime = dt.time();
        String duration  = (String) rMap.get('strTotDuration');
        Integer records  = (Integer) rMap.get('nbrTotRecords');
        Integer size  = (Integer) rMap.get('succesRecords');
        Integer apiCalls  = (Integer) rMap.get('nbrTotApi');
        String status  = (String) rMap.get('objProcStatus');
        string recordString = activityID+','+rDate+','+rTime+','+ duration +','+records
            +','+size +','+apiCalls +','+status +'\n';
        return recordString;
    } 
    
    public static  String getBackupObject(Map<String, Object> rMap){
        Integer activityID = (Integer) rMap.get('backupId');
        Long rDateTime = (Long) rMap.get('tmStamp');
        DateTime dt = DateTime.newInstance(rDateTime);
        Date rDate = dt.date();
        Time rTime = dt.time();
        Integer duration  = (Integer) rMap.get('strTotDuration');
        Integer records  = (Integer) rMap.get('nbrTotRecords');
        Integer size  = (Integer) rMap.get('successCount');        
        Integer apiCalls = (Integer) rMap.get('nbrTotApi');
        String status  = (String) rMap.get('objProcStatus');
        string recordString = activityID+','+rDate+','+rTime+','+ duration +','+records
            +','+size +','+apiCalls +','+status +'\n';
        return recordString;
    }
    
    @AuraEnabled
    public static String sendEmailNotification(String sfOrgId, String objects, String mMail, String subject){
        string header = 'Activity ID, Date, Time, Duration, Records, Success, API Calls, Status \n';
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